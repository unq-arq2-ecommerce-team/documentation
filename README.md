# Documentacion de los servicios del tp Arquitectura 2


## Enunciados

[Entrega 1 - Enunciado del Trabajo Práctico](https://github.com/unq-arq2-ecommerce-team/documentation/blob/main/enunciados/Arq2%20-%20Trabajo%20practico%20-%20Entrega1.pdf)

[Entrega 2 - Enunciado del Trabajo Práctico](https://github.com/unq-arq2-ecommerce-team/documentation/blob/main/enunciados/Arq2%20-%20Trabajo%20practico%20-%20Entrega2.pdf)


## Arquitectura


<--- Poner version final --->


## Inicializar servicios

### Prerequisitos:

- Bash
- Git
- Docker
- Docker-compose


### Instrucciones

1) Clonar el presente repositorio y ejecutar los siguientes pasos dentro de este.

```git clone https://github.com/unq-arq2-ecommerce-team/documentation.git```

```cd ./documentation```

2) Clonar los siguientes repositorios dentro del directorio creado:

- [Users-service - https://github.com/unq-arq2-ecommerce-team/users-service](https://github.com/unq-arq2-ecommerce-team/users-service)

    ```git clone https://github.com/unq-arq2-ecommerce-team/users-service```

- [Products-orders-service - https://github.com/unq-arq2-ecommerce-team/products-orders-service](https://github.com/unq-arq2-ecommerce-team/products-orders-service)

    ```git clone https://github.com/unq-arq2-ecommerce-team/products-orders-service```

- [Payments-service - https://github.com/unq-arq2-ecommerce-team/payments-service](https://github.com/unq-arq2-ecommerce-team/payments-service)

    ```git clone https://github.com/unq-arq2-ecommerce-team/payments-service```

- [Notifications-service - https://github.com/unq-arq2-ecommerce-team/notifications-service](https://github.com/unq-arq2-ecommerce-team/notifications-service)

    ```git clone https://github.com/unq-arq2-ecommerce-team/notifications-service```

- [Order-orchestrator - https://github.com/unq-arq2-ecommerce-team/order-orchestrator](https://github.com/unq-arq2-ecommerce-team/order-orchestrator)

    ```git clone https://github.com/unq-arq2-ecommerce-team/order-orchestrator```



3) Modificar todas las envs de "./<servicio>/resources/local.env" de cada servicio con los datos correspondientes. 

Recomendacion: Cambiar en envs "localhost" con "servicio". Ejemplo:

products-orders-service recomendacion al usar docker-compose:
```
    SELLER_URL_FIND_BY_ID=http://users-service:8081/api/v1/seller/{sellerId}
```

4) Ejecutar el script runServices.sh que ejecuta el docker-compose.yml

    ```chmod +X ./runServices.sh```

    ```./runServices.sh```

