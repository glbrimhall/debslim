#!/bin/bash
set -x

NETWORK=${5:-host}

TAG=${4:-bookworm}
CONTAINER=${3:-xrdp-ibkr-test}
REPOSITORY=${2:-xrdp-ibkr}
DAEMONIZE=-d
TRADE_PORT=5000
SSH_PORT=22
RDP_PORT=3389

# Delete test container built from docker file
docker stop $CONTAINER
docker rm $CONTAINER

if [ "$NETWORK" = "host" ]; then

docker run $DAEMONIZE $DEBUG \
       --net=$NETWORK \
       --name $CONTAINER \
       --restart=unless-stopped \
     $REPOSITORY:$TAG

#docker run --user root -it --entrypoint /bin/bash \
#       --net=$NETWORK \
#       --name $CONTAINER \
#       $REPOSITORY:$TAG

else

docker run $DAEMONIZE $DEBUG \
       --net=$NETWORK \
       --name $CONTAINER \
       --restart=unless-stopped \
  -p 22000:$SSH_PORT \
  -p $RDP_PORT:$RDP_PORT \
  -p $TRADE_PORT:$TRADE_PORT \
     $REPOSITORY:$TAG

fi
