#
# Debian with shell colors enabled
#
# Ideas were taken from https://hub.docker.com/r/josefcs/debian-apache/~/dockerfile/
#

# Pull base image
FROM glbrimhall/debslim:color-stretch
#FROM bitnami/minideb:stretch

# Make apt-get commands temporarily non-interactive
# Solution from https://github.com/phusion/baseimage-docker/issues/58
# Update apt cache to use fastest local mirror
RUN \
export DEBIAN_FRONTEND=noninteractive && \
export DEBCONF_NONINTERACTIVE_SEEN=true && \
apt-get update && \
apt-get install -y manpages info libterm-readline-perl-perl apt-transport-https curl wget emacs-nox vim lftp openssh-client netcat-openbsd bzip2 p7zip zip && \
apt-get clean

ENV DEBIAN_FRONTEND=readline
