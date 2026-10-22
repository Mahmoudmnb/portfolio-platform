#!/bin/sh
set -eu
umask 077
if [ "$#" -ne 2 ] || [ -e "$1" ] || [ ! -r "$2" ]; then
  echo 'Usage: backup.sh NEW_SECURE_DIRECTORY PRIVATE_MYSQL_OPTION_FILE' >&2
  exit 1
fi
: "${MYSQL_DATABASE:?Set MYSQL_DATABASE to the database to back up}"
mkdir -p -- "$1"
# The private option file contains [client] host/user/password, not command-line credentials.
mysqldump --defaults-extra-file="$2" --single-transaction --quick --hex-blob --skip-lock-tables --no-tablespaces "$MYSQL_DATABASE" > "$1/database.sql"
tar -C storage -czf "$1/media.tar.gz" app
echo 'Database and media backup completed. Preserve APP_KEY separately and encrypt backups.'
