import {
  defineRailway,
  github,
  group,
  postgres,
  project,
  redis,
  service,
  volume,
} from "railway/iac";

const REPO = "mohit-nagaraj/Hi.Events";
const DEMO_SEED_EMAIL = "sentinel-demo@example.com";
const DEMO_SEED_PASSWORD = "DemoPass123!";

function laravelAppKey(hex: string): string {
  return `base64:${Buffer.from(hex, "hex").toString("base64")}`;
}

export default defineRailway((ctx) => {
  const db = postgres("Postgres");
  const cache = redis("Redis");
  const uploads = volume("hi-events-storage", { sizeMB: 2048 });

  const app = service("Hi-Events", {
    source: github(REPO, { branch: "develop" }),
    build: {
      builder: "DOCKERFILE",
      dockerfilePath: "Dockerfile.all-in-one",
    },
    start:
      "/bin/sh -c 'mkdir -p /app/backend/storage/framework/views /app/backend/storage/framework/cache/data /app/backend/storage/framework/sessions /app/backend/storage/logs /app/backend/storage/app/public /app/backend/storage/app/private && exec /startup.sh'",
    healthcheck: "/up",
    healthcheckTimeout: 600,
    deploy: {
      restartPolicyType: "ON_FAILURE",
      restartPolicyMaxRetries: 10,
    },
    volumeMounts: {
      "/app/backend/storage": uploads,
    },
    env: {
      PORT: "80",
      APP_ENV: "production",
      APP_DEBUG: "false",
      APP_LOCALE: "en",
      APP_KEY: laravelAppKey(ctx.randomString("app-key", 32)),
      JWT_SECRET: ctx.randomString("jwt-secret", 32),
      LOG_CHANNEL: "stderr",
      DB_CONNECTION: "pgsql",
      DATABASE_URL: db.env.DATABASE_URL,
      REDIS_HOST: cache.env.REDISHOST,
      REDIS_PORT: cache.env.REDISPORT,
      REDIS_PASSWORD: cache.env.REDIS_PASSWORD,
      CACHE_DRIVER: "redis",
      SESSION_DRIVER: "redis",
      QUEUE_CONNECTION: "redis",
      MAIL_MAILER: "log",
      MAIL_FROM_NAME: "Hi.Events",
      MAIL_FROM_ADDRESS: "noreply@hi.events",
      FILESYSTEM_PUBLIC_DISK: "public",
      FILESYSTEM_PRIVATE_DISK: "local",
      APP_SAAS_MODE_ENABLED: "false",
      APP_DISABLE_REGISTRATION: "false",
      APP_EVENT_SPAM_CHECK_ENABLED: "false",
      CORS_ALLOWED_ORIGINS: "*",
      APP_FRONTEND_URL: "https://${{RAILWAY_PUBLIC_DOMAIN}}",
      APP_CDN_URL: "https://${{RAILWAY_PUBLIC_DOMAIN}}/storage",
      VITE_APP_NAME: "Hi.Events",
      VITE_FRONTEND_URL: "https://${{RAILWAY_PUBLIC_DOMAIN}}",
      VITE_API_URL_CLIENT: "https://${{RAILWAY_PUBLIC_DOMAIN}}/api",
      VITE_API_URL_SERVER: "http://localhost:80/api",
      VITE_STRIPE_PUBLISHABLE_KEY: "",
      SEED_DEMO: "true",
      DEMO_SEED_EMAIL,
      DEMO_SEED_PASSWORD,
    },
  });

  return project("hi-events", {
    resources: [group("Hi.Events", [db, cache, uploads, app])],
  });
});
