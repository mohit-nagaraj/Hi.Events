# Railway deployment (source-built fork)

This fork deploys Hi.Events from the checked-out Git commit, not the upstream
one-click `daveearley/hi.events-all-in-one:latest` image. Sentinel needs that
commit identity for PR blast-radius verification.

## Services

- **Hi-Events** — `Dockerfile.all-in-one` (nginx, PHP-FPM, SSR, queue, scheduler)
- **Postgres** — isolated datastore per environment
- **Redis** — queues, cache, sessions
- **hi-events-storage** — persistent Laravel storage volume

On boot nginx and PHP-FPM start immediately so `GET /up` can pass. The
container then waits for Postgres, migrates with retries, starts Node / the
queue worker / the scheduler, and runs `php artisan demo:seed --confirm
--skip-if-exists` when `SEED_DEMO=true`. Seed failures are logged and retried;
they do not take the replica down.

## Demo login

- Email: `sentinel-demo@example.com`
- Password: `DemoPass123!` (the upstream `demo:seed` default)

`APP_KEY` and `JWT_SECRET` are generated per Railway environment by IaC.
Do not put production payment or mail credentials on this project.

## PR environments

Enable **PR Environments** in Project Settings → Environments. Do **not** enable
Focused PR Environments: each preview must copy Postgres and Redis so the PR
head has an isolated, freshly seeded database.

Railway-provided domains on the production Hi-Events service are required so
each PR environment gets its own `*.up.railway.app` URL.
