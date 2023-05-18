#!/bin/bash

# Evaluates
if [ ! -f "./docker-compose.yml" ]
then
    echo "[ERROR] - File ./docker-compose.yml not found"
    echo "[INFO] - Execute script at same level folder where it belongs"
    exit 1
fi


# Eval if exist services cloned
if [ ! -d "./users-service" ] || [ ! -d "./products-orders-service" ] || [ ! -d "./order-orchestrator" ] || [ ! -d "./payment-service" ] || [ ! -d "./notification-service" ] 
then
    echo "[ERROR] - Step of clone services failed"
    echo "[INFO] - Please read README.md and complete step 1"
    exit 1
fi

echo "Executing docker-compose: "

# Build and instance containers with docker-compose info
docker-compose -p 'arq2' up -d --build 

echo "Script runServices sucessfull"
echo "Please verify if containers are running up ok in arq2"