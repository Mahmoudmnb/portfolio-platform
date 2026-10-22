# Local development

Prerequisites: Docker Engine with Compose v2, or PHP 8.5 (pdo_pgsql, GD with JPEG/PNG/WebP, mbstring, DOM/XML, curl, fileinfo, bcmath, zip, pcntl), Composer 2.9 and PostgreSQL 18. No Node build is required for this JSON backend.

From the repository root:

```sh
cp backend/.env.example backend/.env
# Set APP_KEY once. With host PHP:
cd backend
composer install
php artisan key:generate
cd ..
docker compose build
docker compose up -d postgres mailpit
docker compose run --rm app php artisan migrate --force
docker compose run --rm app php artisan db:seed --force
docker compose run --rm app php artisan app:create-owner
docker compose up -d app worker scheduler
curl -f http://localhost:8000/up
curl -f http://localhost:8000/api/v1/ready
```

Without host PHP, generate a key with `docker compose run --rm app php artisan key:generate --show`, copy its output into the local `.env` securely, then proceed. Never commit `.env`. Build does not create keys or migrate. Host ports are APP_PORT, DB_PORT and MAILPIT_PORT; PostgreSQL binds only loopback. Compose credentials are for disposable development only. Set POSTGRES_PASSWORD in the root shell before first database initialization to customize it. Production must use a unique secret.

For host-native PHP set memory_limit=256M, post_max_size=12M and upload_max_filesize=10M in php.ini (the Docker image includes these). For host-native development use `DB_HOST=127.0.0.1`, your database port and credentials. Create databases `portfolio` and `portfolio_testing`; the latter must be isolated and disposable. Start `php artisan serve --host=0.0.0.0`, `php artisan queue:work --tries=3 --timeout=90` and `php artisan schedule:work` in separate terminals. Run migrations and singleton seed explicitly.

Set APP_URL to the LAN-reachable address, such as `http://192.168.1.50:8000`, for physical Android devices. Set MEDIA_URL to that base plus `/storage`. Local media is served through Laravel's public storage link (`php artisan storage:link`); preserve storage/app/public. Emulator addresses depend on the emulator. Never ship a localhost media URL to a physical device.

## Checks

```sh
cd backend
vendor/bin/pint --test
vendor/bin/phpstan analyse --memory-limit=512M
php artisan test
composer audit --locked
python3 ../scripts/check-openapi.py
```

Test variables belong in `.env.testing` or the shell (never use production credentials). PHPUnit defaults to portfolio_testing on localhost; override DB_HOST/DB_PORT/DB_USERNAME/DB_PASSWORD. `RefreshDatabase` migrates the test database. Test migrations explicitly with `APP_ENV=testing php artisan migrate:fresh`, rollback, then migrate. Never run these against production.

`php artisan app:demo` creates deterministic fictional draft content only outside production. No demo owner/password is seeded. Poll admin media detail until ready before attaching it. Queue failures are visible through `queue:failed`; fix the cause before `queue:retry all`.

The contract validator needs Python 3.13 and `pip install -r scripts/requirements.txt` (run from the repository root, preferably in a virtual environment). Run the PHPUnit suite before the validator to produce actual response fixtures; the validator also checks the 58-operation route inventory. The OpenAPI file intentionally uses JSON syntax, valid in YAML 1.2.

An optional actual HTTP smoke test is `scripts/smoke-http.py`. It refuses non-loopback hosts and requires `SMOKE_CONFIRM_DISPOSABLE=1`, `SMOKE_EMAIL` and `SMOKE_PASSWORD` in its environment. Bootstrap a fictional owner interactively in a disposable development database, start the web server on port 18080 and a database queue worker, then run the script. It creates and cleans up fictional content/media/inquiries, records aggregate/audit events and revokes its login token. Never run it against real content. Do not put real passwords into shell history; use a secure prompt/environment manager. The tested local run used APP_DEBUG=false and an independent worker.
