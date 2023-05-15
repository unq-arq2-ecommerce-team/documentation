#!/bin/bash

# Evaluates
if [ ! -f "./docker-compose.yml" ]
then
    echo "[ERROR] - File ./docker-compose.yml not found"
    echo "[INFO] - Execute script at same level folder where it belongs"
    exit 1
fi

# Eval if exist services cloned
if [ ! -f "./users-service" ] || [! -f "./products-orders-service"]
then
    echo "[ERROR] - Step of clone services failed"
    echo "[INFO] - Please read README.md and complete step 1"
fi

# Build and instance containers with docker-compose info
docker-compose up -d --build