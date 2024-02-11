#!/bin/bash

# postgeresinit.sh

# PostgreSQL 15 için Alpine tabanlı bir Docker konteyneri başlatır
docker run --name postgres15 -p 5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres:15-alpine

# postgres.sh

# PostgreSQL 15 için Alpine tabanlı Docker konteynerine bağlanır
docker exec -it postgres15 psql

# createdb.sh

# PostgreSQL 15 için Alpine tabanlı Docker konteynerinde bir veritabanı oluşturur
docker exec -it postgres15 createdb --username=root --owner=root go-chat

# dropdb.sh

# PostgreSQL 15 için Alpine tabanlı Docker konteynerinde bir veritabanını siler
docker exec -it postgres15 dropdb go-chat


#run the file use to be 'chmod +x dockerinit.sh' after that ./dockerinit.sh