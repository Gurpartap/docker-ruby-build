FROM ubuntu:14.04.1

MAINTAINER Gurpartap Singh <hi@gurpartap.com>

#
# Environment variables
#

ENV DEBIAN_FRONTEND noninteractive

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8 ;\
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale ;\
    dpkg-reconfigure locales

#
# Install tools & libs to compile ruby
#

RUN apt-get update

RUN apt-get install -y \
build-essential \
libssl-dev \
libreadline-dev \
wget \
git-core

RUN apt-get clean

#
# Install ruby-build
#

RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/src/ruby-build

RUN cd /usr/local/src/ruby-build && ./install.sh

#
# Install ruby and bundler gem
#

RUN ruby-build rbx-2.2.9 /usr/local

RUN gem install --no-rdoc --no-ri bundler
