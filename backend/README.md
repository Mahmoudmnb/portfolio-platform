# Portfolio REST API

Laravel 13 / PHP 8.5 / PostgreSQL 18. Start with the root [README](../README.md), [development instructions](../docs/development.md), [API contract](../docs/openapi.yaml), and [client guide](../docs/api-integration.md).

```sh
composer install
cp .env.example .env
php artisan key:generate
# Configure PostgreSQL before migrating.
php artisan migrate
php artisan db:seed
php artisan storage:link
php artisan app:create-owner
```

No administrator is seeded. See `app:recover-owner` for interactive recovery. A running queue worker is required for image processing and durable deletion. CI runs PostgreSQL tests, Pint, static analysis, dependency audit and contract checks. Never use a production database for tests.
