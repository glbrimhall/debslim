#!/bin/bash
set -x

NETWORK=${5:-host}

TAG=${4:-bookworm}
CONTAINER=${3:-debslim-xrdp-test}
REPOSITORY=${2:-debslim-xrdp}
ACTION=${1:-BUILD}
DAEMONIZE=-d
TRADE_PORT=4000
SSH_PORT=22
RDP_PORT=3389

# Delete test container built from docker file
docker stop $CONTAINER
docker rm $CONTAINER

if [ "$ACTION" = "BUILD" ]; then
# Delete test image built from docker file
docker image rm $REPOSITORY:$TAG

# Create test image from docker file
sed -e s/#HOSTNAME#/$HOSTNAME/g Dockerfile.template > Dockerfile
docker build --rm -t $REPOSITORY:$TAG .
rm Dockerfile

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
       --name $CONTAINER \
       --restart=always \
  -p 22000:$SSH_PORT \
  -p $RDP_PORT:$RDP_PORT \
  -p $TRADE_PORT:$TRADE_PORT \
       $REPOSITORY:$TAG

fi
