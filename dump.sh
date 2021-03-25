#!/bin/bash

echo "dump current countries db"
date

echo "docker exec -i sql_server pg_dump -U mango -h localhost -d mango --compress=2 --format=custom --file=/mango.dump"
docker exec -i sql_server pg_dump -U mango -h localhost -d mango --compress=2 --format=custom --file=/mango.dump

date
echo "dump.sh DONE"
