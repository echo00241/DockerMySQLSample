#!/bin/bash

IMAGE_NAME="mb_image"
CONTAINER_NAME="mb_container"

export PATH_PREFIX=`cd \`dirname $0\`;pwd`
#echo $PATH_PREFIX

echo "container_count : "`docker ps -a | grep $CONTAINER_NAME | wc -l`
if [ `docker ps -a | grep $CONTAINER_NAME | wc -l` -ge 1 ]; then
  docker rm -f $CONTAINER_NAME
fi


# $1 : Image_name
docker run -d -p 13306:3306 --name $CONTAINER_NAME $IMAGE_NAME
#docker run -it --rm $IMAGE_NAME bash
