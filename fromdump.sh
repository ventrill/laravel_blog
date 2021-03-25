#!/bin/bash

echo "dump current countries db"
date

#source ./lib/db-clean.sh
echo "DB clean"
docker exec -i sql_server psql -d mango -U mango -c 'SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE datname = current_database() AND pg_stat_activity.pid <> pg_backend_pid();'

echo "docker exec -i sql_server dropdb mango -U mango"
docker exec -i sql_server dropdb mango -U mango

echo "docker exec -i sql_server createdb mango -U mango"
docker exec -i sql_server createdb mango -U mango


echo "DB restore"
echo "docker exec -i sql_server pg_restore -d mango -U mango --jobs=8 --no-owner /mango.dump"
docker exec -i sql_server pg_restore -d mango -U mango --jobs=8 --no-owner /mango.dump

date
echo "dump.sh DONE"
