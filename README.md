# Documentación de los servicios del TP Arquitectura 2


## Enunciados

[Entrega 1 - Enunciado del Trabajo Práctico](https://github.com/unq-arq2-ecommerce-team/documentation/blob/main/enunciados/Arq2%20-%20Trabajo%20practico%20-%20Entrega1.pdf)

[Entrega 2 - Enunciado del Trabajo Práctico](https://github.com/unq-arq2-ecommerce-team/documentation/blob/main/enunciados/Arq2%20-%20Trabajo%20practico%20-%20Entrega2.pdf)


## Diagramas y documentos


[Ir a sección de diagramas y documentos](https://github.com/unq-arq2-ecommerce-team/documentation/blob/main/docs)


## Tests de integración

1) Ejecutar guia de inicializar servicios exitosamente.

2) Descargar [Coleccion de Postman](https://github.com/unq-arq2-ecommerce-team/documentation/tree/main/integration-tests)

3) Importarlo desde postman

4) Ejecutar los request y validar que pasen sus tests

## Inicializar servicios

### Prerequisitos:

- Bash
- Git
- Docker
- Docker-compose
- MongoCLI y DB (opcional) 


### Instrucciones

0) Personalizar mongo db ejecutar (opcional sino pedir url y credenciales de mongo atlas)

```js
db.createCollection("counters")
db.getCollection("counters").insertMany([
{
    "_id" : "customers",
    "seq" : NumberLong(0)
},
{
    "_id" : "sellers",
    "seq" : NumberLong(0)
},
{
    "_id" : "orders",
    "seq" : NumberLong(0)
},
{
    "_id" : "products",
    "seq" : NumberLong(0)
}])

db.createCollection("customer")
db.createCollection("sellers")
db.createCollection("products")
db.createCollection("orders")
```

1) Clonar el presente repositorio y ejecutar los siguientes pasos dentro de este.

```git clone https://github.com/unq-arq2-ecommerce-team/documentation.git```

```cd ./documentation```

2) Clonar los siguientes repositorios dentro del directorio creado [OPCIONAL - Si se ejecuta mas adelante el script "runServices.sh"]: 

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



3) Modificar las envs de "./envs/env-{servicio}.env" de cada servicio con los datos correspondientes. 

Recomendacion: Cambiar en envs "localhost" con "servicio". Ejemplo:

"products-orders-service" recomendacion al usar docker-compose:

```
    SELLER_URL_FIND_BY_ID=http://users-service:8081/api/v1/seller/{sellerId}
```

NOTA: Tambien agregar las credenciales de mongo con su db correspondiente.

4) Ejecutar el script `runServices.sh` que ejecuta el docker-compose.yml (si no se ejecuto el paso 2, se pueden pasar el flag -c o --clone para clonar todos los repos, el script borra los directorios clonados si se selecciona esa opcion). Ir a la seccion de "RunServices Script Args" para ver que flags son validos.

Dar permisos al script:

    ```chmod +X ./runServices.sh```

Sin limpiar ni clonar repos

    ```./runServices.sh``` 

Limpiar y clonar repos

    ```./runServices.sh --clone```


## RunServices Script Args:

|Flag        | Valor    | Descripcion|
|------------|----------|------------|
| -c --clone |   -      | Limpia y clona repositorios|
| -u --user  |   user_mongo     | (No disponible) usuario de mongo |
| -p --pass  |   pass_mongo     | (No disponible) contraseña de usuario mongo|

