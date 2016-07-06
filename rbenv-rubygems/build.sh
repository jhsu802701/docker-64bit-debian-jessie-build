#!/bin/bash

DOCKER_IMAGE='jhsu802701/debian-jessie-rbenv-rubygems'

DATE=`date +%Y_%m%d_%H%M_%S`
DIR_ROOT=$(dirname $PWD)
DIR_LOG=$DIR_ROOT/log
mkdir -p $DIR_LOG

docker build -t $DOCKER_IMAGE . 2>&1 | tee $DIR_LOG/build-$DATE.txt
echo '------------------------------'
echo "docker run -i -t $DOCKER_IMAGE"
docker run -i -t $DOCKER_IMAGE
