#
# Debian with shell colors enabled
#
# Ideas were taken from https://hub.docker.com/r/josefcs/debian-apache/~/dockerfile/
#

# Pull base image
FROM glbrimhall/debslim:editors-stretch
#FROM bitnami/minideb:stretch

# Make apt-get commands temporarily non-interactive
# Solution from https://github.com/phusion/baseimage-docker/issues/58
# Update apt cache to use fastest local mirror
RUN \
export DEBIAN_FRONTEND=noninteractive && \
export DEBCONF_NONINTERACTIVE_SEEN=true && \
apt-get update && \
apt-get install -y git gnupg xfonts-utils && \
apt-get clean

RUN cd ~ && \
git clone https://github.com/glbrimhall/dot.SpaceVim.d.git .SpaceVim.d && \
./.SpaceVim.d/install-spacevim.sh


