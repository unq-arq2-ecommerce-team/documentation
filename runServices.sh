#!/bin/bash

# var para clonar repositorios
cloneRepos=false

# get args
for arg in "$@"
do
  if [ "$arg" == "--clone" ]; then
    cloneRepos=true
  fi
done

echo "[INFO] - cloneRepos with value: $cloneRepos"
# Evaluates
if [ ! -f "./docker-compose.yml" ]
then
    echo "[ERROR] - File ./docker-compose.yml not found"
    echo "[INFO] - Execute script at same level folder where it belongs"
    exit 1
fi

# Removes repos and clone again if apply
if [ "$cloneRepos" = true ] ; then
    echo '[INFO] - Option clone repos true'
    echo '[INFO] - Clean repos'
    rm -rf ./users-service
    rm -rf ./products-orders-service
    rm -rf ./order-orchestrator
    echo '[INFO] - Clean repos done'

    echo '[INFO] - Cloning repos'
    git clone https://github.com/unq-arq2-ecommerce-team/users-service
    git clone https://github.com/unq-arq2-ecommerce-team/products-orders-service
    git clone https://github.com/unq-arq2-ecommerce-team/order-orchestrator
    echo '[INFO] - Cloning repos done'
fi


# Eval if exist services cloned
if [ ! -d "./users-service" ] || [ ! -d "./products-orders-service" ] || [ ! -d "./order-orchestrator" ] # || [ ! -d "./payment-service" ] || [ ! -d "./notification-service" ] 
then
    echo "[ERROR] - Step of clone services failed"
    echo "[INFO] - Please read README.md and complete step 1"
    exit 1
fi

echo "[INFO] - Executing docker-compose: "

# Build and instance containers with docker-compose info
docker-compose -p 'arq2' up -d --build 

# Save status of last command
DOCKER_COMPOSE_STATUS=$?

if [ "$DOCKER_COMPOSE_STATUS" == "0" ]
then
    echo "[INFO] - Script runServices sucessfull"
    echo "[INFO] - Please verify if containers are running up ok in arq2"
else
    echo "[ERROR] - docker compose status returned: $DOCKER_COMPOSE_STATUS"
    echo "[ERROR] - Something when wrong when execute docker compose. Please verify your docker and try again"
fi
