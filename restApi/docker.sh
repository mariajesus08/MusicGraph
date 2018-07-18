#!/usr/bin/env bash

## este script automatiza la construccion de imagen, detencion y remoción de contenedores antiguos

TAG=back-tbd #tag de la imagen a crear, puede incluir version en formato nombre:version
API=back-tbd #nombre del contenedor en tiempo de ejecucion
PORT=9091 #puerto que se quiere exponer hacia el host
HOSTPORT=9091 #puerto del host, mediante el cual se accede al contenedor

echo "building image"
docker build -t $TAG .

if docker container ls | grep $API > /dev/null; then
  echo "stopping old container"
  docker container stop $API
fi

if docker container ls -a | grep $API > /dev/null; then
  echo "removing old container"
  docker container rm $API
fi

echo "launching container"
## si se quiere agregar volumenes se debe hacer en esta luego de docker run y antes de --name
## importante que ya incluye volumen para la carpeta .gradle, lo cual hace que las construcciones posteriores demoren menos
docker run --name $API -d --restart unless-stopped -p $HOSTPORT:$PORT $TAG
