#!/bin/sh
set -euo pipefail
DATE=$(date -I)
cd /var/lib/clickhouse-backup
clickhouse client -q "SELECT * FROM sentry_local INTO OUTFILE 'sentry_local-$DATE.csv' FORMAT CSVWithNames"
clickhouse client -q "SHOW CREATE TABLE sentry_local" > schema-$DATE.sql
