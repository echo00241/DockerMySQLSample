#!/bin/bash

IMAGE_NAME="mb_image"
CONTAINER_NAME="mb_container"
IMAGES_COUNT=`docker images | grep -c  "$IMAGE_NAME"`


echo $IMAGES_COUNT
if  [ $IMAGES_COUNT -ge 1 ]; then
  docker ps | grep $IMAGE_NAME | awk '{ print $1 }' | xargs docker kill 
  docker ps -a | grep $IMAGE_NAME | awk  '{print $1}' | xargs docker rm
  docker rmi $IMAGE_NAME 
fi


docker build -t $IMAGE_NAME .
