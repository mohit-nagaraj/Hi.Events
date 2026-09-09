# Railway deployment (source-built fork)

This fork deploys Hi.Events from the checked-out Git commit, not the upstream
one-click `daveearley/hi.events-all-in-one:latest` image. Sentinel needs that
commit identity for PR blast-radius verification.

## Services

- **Hi-Events** — `Dockerfile.all-in-one` (nginx, PHP-FPM, SSR, queue, scheduler)
- **Redis** — queues, cache, sessions (Railway). PR previews clone Redis.
- **Supabase Postgres + Storage** — shared by production and PR previews (demo).
  Images live on the public `hi-events-public` bucket (S3 protocol). Do not
  attach a Railway volume for Laravel storage on the Free plan.

On boot nginx and PHP-FPM start immediately so `GET /up` can pass. The
container then waits for Postgres (`DATABASE_URL`, including `sslmode`),
migrates with retries, starts Node / the queue worker / the scheduler, and
runs `php artisan demo:seed --confirm --skip-if-exists` when `SEED_DEMO=true`.
Seed failures are logged and retried; they do not take the replica down.

## Demo login

- Email: `sentinel-demo@example.com`
- Password: `DemoPass123!` (the upstream `demo:seed` default)

`APP_KEY` and `JWT_SECRET` are generated per Railway environment by IaC.
Do not put production payment or mail credentials on this project.

## PR environments

Enable **PR Environments** in Project Settings → Environments. Keep **Focused
PR Environments off**. Previews clone Hi-Events + Redis and inherit production
variables, including the shared Supabase `DATABASE_URL` and S3 keys. That is
intentional for this demo: one database and one image bucket.

Set `APP_FRONTEND_URL`, `VITE_FRONTEND_URL`, and `VITE_API_URL_CLIENT` to
`https://${{RAILWAY_PUBLIC_DOMAIN}}` (and `/api` for the client API) so each
preview gets its own hostname. Leave `APP_CDN_URL` / `AWS_URL` on the Supabase
public bucket URL.

Keep `SEED_DEMO=false` after the first production seed so PR boots do not spend
RAM re-seeding. `demo:seed --skip-if-exists` is still safe if it runs.

Railway-provided domains on the production Hi-Events service are required so
each PR environment gets its own `*.up.railway.app` URL.
