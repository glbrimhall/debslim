#!/bin/bash
set -x

NETWORK=${5:-host}

TAG=${4:-stretch}
CONTAINER=${3:-debslim-spacevim-test}
REPOSITORY=${2:-debslim-spacevim}
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
    DEBUG='--user root -it --entrypoint "//bin//bash"'
fi

NETWORK=host

if [ "xx$MSYSTEM" != "xx" ]; then
  WINPTY='winpty'
fi

if [ "$ACTION" = "COMPOSE" ]; then

$WINPTY docker run --user root -it --entrypoint "//bin//bash" \
       --net=$NETWORK \
       --name $CONTAINER \
       -v 'c://://win' \
       $REPOSITORY:$TAG

else

$WINPTY docker run $DAEMONIZE $DEBUG \
       --net=$NETWORK \
       --name $CONTAINER \
       -v 'c://://win' \
       $REPOSITORY:$TAG

fi
