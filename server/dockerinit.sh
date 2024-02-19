#!/bin/bash

function postgresinit() {
    docker run --name postgres15 -p 5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres:15-alpine
}

function postgres() {
    docker exec -it postgres15 psql
}

function createdb() {
    docker exec -it postgres15 createdb --username=root --owner=root go-chat
}

function dropdb() {
    docker exec -it postgres15 dropdb go-chat
}

function migrateup() {
    migrate -path db/migrations -database "postgresql://root:password@localhost:5433/go-chat?sslmode=disable" -verbose up
}

function migratedown() {
    migrate -path db/migrations -database "postgresql://root:password@localhost:5433/go-chat?sslmode=disable" -verbose down
}
