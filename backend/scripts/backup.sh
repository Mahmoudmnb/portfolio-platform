#!/bin/sh
set -eu
umask 077
if [ "$#" -ne 1 ] || [ -e "$1" ]; then
  echo 'Usage: backup.sh NEW_SECURE_DIRECTORY (must not exist)' >&2
  exit 1
fi
mkdir -p -- "$1"
pg_dump --format=custom --no-owner --no-acl --file="$1/database.dump"
tar -C storage -czf "$1/media.tar.gz" app
echo 'Database and media backup completed. Preserve APP_KEY separately and encrypt backups.'
