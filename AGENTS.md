# Portfolio platform

Read `docs/backend-implementation-plan.md` and `docs/backend-progress.md` before backend changes. Implement only `backend/`, backend documentation and infrastructure. Preserve `website/`, `dashboard/` and `packages/portfolio_api/`; their clients are not part of this backend task.

Use real MySQL and MariaDB for integration tests. The October 2026 MySQL/Hostinger migration supersedes the original PostgreSQL implementation plan. Never commit secrets, uploaded visitor data, local databases or administrator passwords. Never deploy publicly or run destructive production migrations without explicit authorization. Keep API contract, integration guide and progress evidence aligned with behavior. See backend/AGENTS.md for commands.
