#!/bin/bash

if [ "$(uname -m)" = "x86_64" ]; then 
    docker-compose up -d
else
    docker-compose -f docker-compose-raspi.yml up -d
fi


echo "Grafana: http://127.0.0.1:3000 - admin/admin"
echo
echo "Current database list"
curl -G "http://localhost:8086/query?u=admin;p=admin;pretty=true" --data-urlencode "db=glances" --data-urlencode "q=SHOW DATABASES"

echo
echo "Create a new database ?"
echo "curl -XPOST 'http://localhost:8086/query?u=admin;p=admin' --data-urlencode 'q=CREATE DATABASE mydb'"

docker ps -a

