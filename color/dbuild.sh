#!/bin/bash
set -x

NETWORK=${5:-host}

TAG=${4:-bookworm}
CONTAINER=${3:-debslim-color-test}
REPOSITORY=${2:-debslim-color}
ACTION=${1:-BUILD}
DAEMONIZE=-d

# Delete test container built from docker file
docker stop $CONTAINER
docker rm $CONTAINER

if [ "$ACTION" = "BUILD" ]; then
# Delete test image built from docker file
docker image rm $REPOSITORY:$TAG

# Create test image from docker file
docker build --rm -t $REPOSITORY:$TAG .

ACTION=DEBUG

fi

if [ "$ACTION" = "DEBUG" ]; then
    DAEMONIZE=""
    DEBUG="--user root -it --entrypoint /bin/bash"
fi

NETWORK=host

if [ "$ACTION" = "COMPOSE" ]; then

docker run --user root -it --entrypoint /bin/bash \
       --net=$NETWORK \
       --name $CONTAINER \
       $REPOSITORY:$TAG

else

docker run $DAEMONIZE $DEBUG \
       --net=$NETWORK \
       --name $CONTAINER \
       $REPOSITORY:$TAG

fi
