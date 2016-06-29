#!/bin/bash

DOCKER_IMAGE='jhsu802701/debian-jessie-min'

DATE=`date +%Y_%m%d_%H%M_%S`
DIR_ROOT=$(dirname $PWD)
DIR_LOG=$DIR_ROOT/log
mkdir -p $DIR_LOG

# The docker-root-aptget, docker-root-finalize, and docker-user-finalize
# scripts in usr_local_bin are used in the downstream images.
# The docker-action, docker-root, and docker-user scripts are specific
# to each image and get overwritten during the process of creating the
# downstream image.

docker build -t $DOCKER_IMAGE . 2>&1 | tee $DIR_LOG/build-$DATE.txt
echo '------------------------------'
echo "docker run -i -t $DOCKER_IMAGE"
docker run -i -t $DOCKER_IMAGE
