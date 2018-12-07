#
# Debian with shell colors enabled
#
# Ideas were taken from https://hub.docker.com/r/josefcs/debian-apache/~/dockerfile/
#

# Pull base image
FROM glbrimhall/debslim:editors-stretch
#FROM bitnami/minideb:stretch


RUN cd ~ && \
export DEBIAN_FRONTEND=noninteractive && \
export DEBCONF_NONINTERACTIVE_SEEN=true && \
apt-get update && \
apt-get install -y vim-nox git gnupg xfonts-utils && \
git clone https://github.com/glbrimhall/dot.SpaceVim.d.git .SpaceVim.d && \
./.SpaceVim.d/install-spacevim.sh && \
apt-get clean


