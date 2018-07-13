# MusicGraph

TBD - Primer semestre 2018
Grupo 6 : Ricardo Álvarez, Juan Barrera, María Jesús Campos, Sebastián Garay, Natalia Guzmán

## 1- Captura Streaming de Tweets
Se hace el Streaming de twitter y se almacenan en una base de datos de mongo todos los tweets trackeados por palabras claves (artistas).

### Requisitos
* Correr mongo con `$ mongod`.
* En la ruta `captura-tweet/src/main/resources` crear archivo **aplication.properties** a partir del archivo **aplication.properties.default**

### Para correr
* Ubicarse en la carpeta **captura-tweet**.
* Iniciar con `gradle bootRun`.

Se recomienda utilizar **MongoDB Compass Community** para visualizar los tweets obtenidos.

## 2- Análisis de Tweets 
Se crea crea el índice invertido con **lucene** a partir de los tweets alojados en la base de datos de **Mongo**, se realiza el análisis de sentimientos y se almacenan las estadisticas obtenidas en una base de datos **Mysql** 

### Requisitos
* Correr mongo con `$ mongod`.
* Crear base de datos mysql.
* Dentro del gestor de base de datos (se recomienda usar **Valentina Studio**), ejecutar el archivo **BaseDeDatos.sql** ubicado en el directorio raíz para poblar la base de datos para poblar la base de datos.


### Para correr
* dirigirse a la carpeta `analisis-tweets/`
* Iniciar con `gradle bootRun`.

### Notas

* El índice se almacena en la carpeta **indice** en el directorio `analisis-tweets/`.
* La bolsa de palabra para el análisis de sentimientos se encuentra en `analisis-tweets/src/main/resources/positivas.dat`

## 3- Servicio Rest 
Servicio API mediante el cuál se consume la información de la base de datos

### Requisitos:
* Crear archivo **application.properties** en `restApi/src/resources` a partir del archivo **application.properties.default** acorde a la base de datos mysql.

### Para correr:
* dirigirse a la carpeta `apiRest/`
* Iniciar con `gradle bootRun`.

