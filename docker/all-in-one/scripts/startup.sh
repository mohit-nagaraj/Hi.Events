#!/bin/sh

# Listen first so Railway /up can pass, then migrate and seed.
# Seed failures must not take the container down.

cd /app/backend

log() {
    echo "[startup] $*"
}

wait_for_database() {
    attempt=1
    max_attempts="${DB_WAIT_ATTEMPTS:-60}"

    while [ "$attempt" -le "$max_attempts" ]; do
        if php <<'PHP'
<?php
$url = getenv('DATABASE_URL');
if (!$url) {
    fwrite(STDERR, "DATABASE_URL is not set\n");
    exit(1);
}

$parts = parse_url($url);
if ($parts === false || empty($parts['host'])) {
    fwrite(STDERR, "DATABASE_URL is invalid\n");
    exit(1);
}

$host = $parts['host'];
$port = $parts['port'] ?? 5432;
$db = ltrim($parts['path'] ?? '/railway', '/');
$user = urldecode($parts['user'] ?? 'postgres');
$pass = urldecode($parts['pass'] ?? '');
$sslmode = getenv('PGSSLMODE') ?: 'prefer';
if (!empty($parts['query'])) {
    parse_str($parts['query'], $query);
    if (!empty($query['sslmode'])) {
        $sslmode = $query['sslmode'];
    }
}

try {
    new PDO(
        sprintf('pgsql:host=%s;port=%s;dbname=%s;sslmode=%s', $host, $port, $db, $sslmode),
        $user,
        $pass,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_TIMEOUT => 3,
        ]
    );
} catch (Throwable $e) {
    fwrite(STDERR, $e->getMessage() . "\n");
    exit(1);
}
PHP
        then
            log "Postgres is ready"
            return 0
        fi

        log "Waiting for Postgres (attempt ${attempt}/${max_attempts})"
        sleep 2
        attempt=$((attempt + 1))
    done

    log "ERROR: Postgres did not become ready"
    return 1
}

run_migrations() {
    attempt=1
    max_attempts="${MIGRATE_ATTEMPTS:-8}"

    while [ "$attempt" -le "$max_attempts" ]; do
        if php artisan migrate --force; then
            return 0
        fi

        log "Migrate failed (attempt ${attempt}/${max_attempts}); retrying in 5s"
        sleep 5
        attempt=$((attempt + 1))
    done

    return 1
}

run_demo_seed() {
    if [ "${SEED_DEMO:-false}" != "true" ]; then
        return 0
    fi

    if [ -z "${DEMO_SEED_EMAIL:-}" ] || [ -z "${DEMO_SEED_PASSWORD:-}" ]; then
        log "SEED_DEMO=true requires DEMO_SEED_EMAIL and DEMO_SEED_PASSWORD; skipping seed"
        return 0
    fi

    attempt=1
    max_attempts="${SEED_ATTEMPTS:-3}"

    while [ "$attempt" -le "$max_attempts" ]; do
        if php artisan demo:seed --confirm --skip-if-exists --email="$DEMO_SEED_EMAIL" --password="$DEMO_SEED_PASSWORD"; then
            log "Demo seed completed"
            return 0
        fi

        log "Demo seed failed (attempt ${attempt}/${max_attempts}); retrying in 10s"
        sleep 10
        attempt=$((attempt + 1))
    done

    log "WARN: Demo seed did not complete; leaving the app running"
    return 0
}

prepare_laravel() {
    php artisan storage:link || true
    php artisan cache:clear || true
    php artisan config:clear || true
    php artisan route:clear || true
    php artisan view:clear || true
    chown -R www-data:www-data /app/backend || true
    chmod -R 775 /app/backend/storage /app/backend/bootstrap/cache || true
}

stop_supervisor() {
    if [ -n "${SUPERVISOR_PID:-}" ]; then
        kill -TERM "$SUPERVISOR_PID" 2>/dev/null || true
    fi
}

wait_for_supervisor() {
    attempt=1
    while [ "$attempt" -le 30 ]; do
        if supervisorctl -c /etc/supervisord.conf status >/dev/null 2>&1; then
            return 0
        fi
        sleep 1
        attempt=$((attempt + 1))
    done
    return 1
}

start_app_workers() {
    if ! wait_for_supervisor; then
        log "WARN: supervisord is not ready; Node/queue/scheduler were not started"
        return 0
    fi

    log "Starting Node SSR, queue worker, and scheduler"
    supervisorctl -c /etc/supervisord.conf start nodejs laravel-queue-worker laravel-scheduler || true
}

bootstrap() {
    if ! wait_for_database; then
        log "ERROR: cannot reach Postgres"
        stop_supervisor
        exit 1
    fi

    if ! run_migrations; then
        log "ERROR: migrations could not complete. Ensure DATABASE_URL is set."
        stop_supervisor
        exit 1
    fi

    prepare_laravel
    start_app_workers
    run_demo_seed
}

SUPERVISOR_PID=""

term() {
    stop_supervisor
    exit 0
}

trap term TERM INT

log "Starting nginx/PHP-FPM before migrate/seed"
/usr/bin/supervisord -c /etc/supervisord.conf &
SUPERVISOR_PID=$!

bootstrap &
BOOTSTRAP_PID=$!

wait "$SUPERVISOR_PID"
status=$?
kill "$BOOTSTRAP_PID" 2>/dev/null || true
exit "$status"
