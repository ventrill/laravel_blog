#!/bin/bash

sudo echo "start init"

docker stop $(docker ps -a -q)

docker-compose -f ./$COUNTRY_ALIAS/docker-compose.yml build
docker-compose -f ./$COUNTRY_ALIAS/docker-compose.yml up -d

#docker exec -i sql_server dropdb mango -U mango
#docker exec -i sql_server createdb mango -U mango

echo "run.sh DONE"

# php artisan migrate
