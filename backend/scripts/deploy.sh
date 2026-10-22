#!/bin/sh
# Run once per release from backend/, after database/media backup. No migrations on web startup.
set -eu
php artisan down --retry=60
php artisan migrate --force
php artisan db:seed --force
php artisan storage:link --force
php artisan optimize
php artisan queue:restart
php artisan up
