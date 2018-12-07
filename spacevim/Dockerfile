#
# Debian with shell colors enabled
#
# Ideas were taken from https://hub.docker.com/r/josefcs/debian-apache/~/dockerfile/
#

# Pull base image
FROM glbrimhall/debslim:editors-stretch
#FROM bitnami/minideb:stretch


RUN cd ~ && \
git clone https://github.com/glbrimhall/dot.SpaceVim.d.git .SpaceVim.d && \
./.SpaceVim.d/install-spacevim.sh && \
apt-get clean


