#
# Debian with shell colors enabled
#
# Ideas were taken from https://hub.docker.com/r/josefcs/debian-apache/~/dockerfile/
#

# Pull base image
FROM glbrimhall/debslim:spacevim-stretch

RUN \
export DEBIAN_FRONTEND=noninteractive && \
export DEBCONF_NONINTERACTIVE_SEEN=true && \
apt-get update && \
apt-get install -y python-pip python-lxml && \ 
apt-get clean && \
pip install flake8 && \
pip install yapf && \
pip install autoflake && \
pip install isort && \
pip install pillow && \
pip install openpyxl
