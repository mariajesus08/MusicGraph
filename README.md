# MusicGraph

TBD - Primer semestre 2018
Grupo 6 : Ricardo Álvarez, Juan Barrera, María Jesús Campos, Sebastián Garay, Natalia Guzmán

## Configuración

* Crear base de datos mysql y modificar archivo **aplication.properties** acorde a la base de datos.
* Dentro del gestor de base de datos (se recomienda usar **Valentina Studio**), ejecutar el archivo **BaseDeDatos.sql** para poblar la base de datos.

## Ejecutar

### 1- Captura Streaming de Tweets

Requisitos: 
* Correr mongo con `$ mongod`.
* Inicializar servicio de mongo, ejecutar el comando `$ mongo --host localhost:27017` en una nueva terminal.
* Crear archivo **aplication.properties** a partir del archivo **aplication.properties.default**

Para correr:
* Ubicarse en la carpeta **captura-tweet**.
* Iniciar con `gradle bootRun`.

Se recomienda utilizar **MongoDB Compass Community** para visualizar los tweets obtenidos.

### 2- Indexación de Tweets 

Requisitos: 
* Correr mongo con `$ mongod`.
* Inicializar servicio de mongo, ejecutar el comando `$ mongo --host localhost:27017` en una nueva terminal.

Para correr:
* Iniciar con `gradle bootRun`.

### Notas

* El índice se almacena en la carpeta **indice** en la raíz del proyecto.
* La bolsa de palabras para la captura de tweets se encuentra en **captura-tweet/src/main/resources/palabras.dat**
* La bolsa de palabra para el análisis de sentimientos se encuentra en **src/main/resources/positivas.dat**
