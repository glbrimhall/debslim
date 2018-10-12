#
# Debian with shell colors enabled
#
# Ideas were taken from https://hub.docker.com/r/josefcs/debian-apache/~/dockerfile/
#

# Pull base image
FROM debian:stretch-slim

# From https://hub.docker.com/_/debian/
# Set utf8 support by default 
ENV LANG=C.UTF-8 SHELL=/bin/bash DEBIAN_FRONTEND=readline

# Enable directory colors:
RUN \
sed -i "s/^# export LS/export LS/g" /root/.bashrc && \
sed -i "s/^# eval/eval/g" /root/.bashrc && \
sed -i "s/^# alias l/alias l/g" /root/.bashrc && \
sed -i "s/^#alias/alias/g" /etc/skel/.bashrc && \
sed -i "s/^#export/export/g" /etc/skel/.bashrc

# Make apt-get commands temporarily non-interactive
# Solution from https://github.com/phusion/baseimage-docker/issues/58
# Update apt cache to use fastest local mirror
RUN \
export DEBIAN_FRONTEND=noninteractive && \
export DEBCONF_NONINTERACTIVE_SEEN=true && \
apt-get update && \
apt-get install -y procps net-tools apt-utils less nano && \
apt-get clean

