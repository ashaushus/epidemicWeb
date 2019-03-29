#!/usr/bin/env bash

set -e

## Need to figure a better handler, when its not running it throws an error:
id=$(docker inspect -f {{.State.Running}} mysql || echo false)

if [ $id == true ]; then
  echo "Local MySql is running, stopping it now"
  docker kill mysql
  docker rm mysql
else
  echo "No it is not"
fi

docker run -d -e MYSQL_ROOT_PASSWORD=rootpassword -e MYSQL_DATABASE=epidemics -e MYSQL_USER=epidemics -e MYSQL_PASSWORD=epidemics -p 3306:3306 --name mysql mysql:latest

#docker cp src/scripts/setup.sql mysql:setup.sql
#sleep 5
#docker exec -d mysql mysql epidemics -d epidemics -f setup.sql
#sleep 5