#!/bin/bash

IMAGE_NAME="mb_image"
CONTAINER_NAME="mb_container"
export PATH_PREFIX=`cd \`dirname $0\`;pwd`

#echo $PATH_PREFIX

# 特定のイメージでコンテナを起動し、ログインする
docker run -it --rm  -v $PATH_PREFIX/ansible:/etc/ansible $IMAGE_NAME bash
