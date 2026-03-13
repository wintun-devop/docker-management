#!/bin/sh

set -e

echo "Running Prisma migrations..."
npx prisma migrate deploy

echo "Running database seed..."
npx prisma db seed || echo "Seed skipped (may already exist)"

echo "Starting application..."
exec "$@"