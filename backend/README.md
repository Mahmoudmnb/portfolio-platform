# Portfolio REST API

Laravel 13 / PHP 8.5 / MySQL 8.4 / MariaDB 11.8. Start with the root [README](../README.md), [development instructions](../docs/development.md), [API contract](../docs/openapi.yaml), and [client guide](../docs/api-integration.md).

```sh
composer install
cp .env.example .env
php artisan key:generate
# Configure a NEW MySQL/MariaDB database before migrating.
php artisan migrate
php artisan db:seed
php artisan storage:link
php artisan app:create-owner
```

No administrator is seeded. See `app:recover-owner` for interactive recovery. A running queue worker is required for image processing and durable deletion. CI runs MySQL/MariaDB tests and a separate legacy PostgreSQL transfer rehearsal, Pint, static analysis, dependency audit and contract checks. Never use a production database for tests.

Hostinger Business deployment: [runbook](../docs/hostinger-deployment.md). Existing PostgreSQL data: [transfer and reconciliation](../docs/postgres-to-mysql-transfer.md). Never replay edited baseline migrations against an existing PostgreSQL installation.
