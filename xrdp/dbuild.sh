#!/bin/bash
set -x

NETWORK=${5:-host}

TAG=${4:-bookworm}
CONTAINER=${3:-debslim-xrdp-test}
REPOSITORY=${2:-debslim-xrdp}
ARG1=${1:-run}
ACTION=${ARG1^^}
DAEMONIZE=-d
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

ACTION=COMPOSE

fi

if [ "$ACTION" = "COMPOSE" ]; then

NETWORK=host

docker run --rm --user root -it --entrypoint /bin/bash \
       --net=$NETWORK \
       --name $CONTAINER \
       $REPOSITORY:$TAG

else

docker run $DAEMONIZE $DEBUG \
       --name $CONTAINER \
       --restart=always \
  -p 22000:$SSH_PORT \
  -p $RDP_PORT:$RDP_PORT \
     $REPOSITORY:$TAG

fi

