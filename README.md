# Portfolio platform

Laravel REST backend for a portfolio and small team website. Projects and products are portfolio entries; products link to external destinations. This repository does not implement commerce or public user accounts.

- `backend/`: Laravel 13 / PHP 8.5 API, PostgreSQL migrations, queues, tests and container.
- `website/`: reserved for the Jaspr website; no client implemented here.
- `dashboard/`: Flutter Android owner app for content, media, inquiries, analytics and account management.
- `packages/portfolio_api/`: shared pure Dart API client, contract models and tests.

Start with [local setup](docs/development.md), then [client integration](docs/api-integration.md) and the [OpenAPI 3.1 contract](docs/openapi.yaml). See [architecture](docs/architecture.md), [deployment and recovery](docs/deployment.md), [verification progress](docs/backend-progress.md), and [delivery report](docs/backend-completion.md).

The owner is created interactively with `php artisan app:create-owner`; there is no registration endpoint or seeded administrator password. Public data is visible only after explicit publication/activation. Image uploads process asynchronously. Analytics store daily aggregate event counts without visitor identifiers. No production deployment is performed by this repository's CI.

```sh
cp backend/.env.example backend/.env
# Set APP_KEY once; follow docs/development.md for the complete initialization sequence.
docker compose build
docker compose up -d postgres mailpit
```

All commands and verification limitations are recorded in the progress/report documents. Never point tests at a production database.

For the Android dashboard, start with [dashboard development](docs/dashboard-development.md) and read the [completion report](docs/dashboard-completion.md), [finishing progress](docs/dashboard-finishing-progress.md) and [release preparation](docs/dashboard-release-preparation.md). Local checks have recorded results; picker selection, remaining Figma comparisons, ARM64 builds, hosted CI and physical-device checks still have documented gaps. The website remains a reserved directory.
