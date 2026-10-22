#!/bin/sh
# Finite CLI invocation for shared hosting; never start a persistent worker here.
set -eu
cd "$(dirname "$0")/.."
: "${PORTFOLIO_PHP:=php}"
command -v timeout >/dev/null
command -v flock >/dev/null
exec 9>storage/framework/cron-queue.lock
flock -n 9 || exit 0
# max-time is checked between jobs; timeout supplies a hard process deadline.
# A killed reserved job becomes eligible again after DB_QUEUE_RETRY_AFTER=120.
exec timeout --signal=TERM --kill-after=5 105 "$PORTFOLIO_PHP" artisan queue:work database --stop-when-empty --max-time=40 --max-jobs=10 --sleep=1 --tries=3 --timeout=60 --memory=256 --no-interaction
