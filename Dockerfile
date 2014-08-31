FROM ubuntu:14.04.1

MAINTAINER Gurpartap Singh <hi@gurpartap.com>

#
# Environment variables
#

ENV HOME /root
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
autoconf \
automake \
bison \
build-essential \
curl \
git-core \
libc6-dev \
libcurl4-openssl-dev \
libffi-dev \
libreadline-dev \
libsqlite3-dev \
libssl-dev \
libtool \
libxml2-dev \
libxslt1-dev \
libyaml-dev \
ncurses-dev \
nodejs \
python-software-properties \
sqlite3 \
wget \
zlib1g-dev

#
# Install ruby-build
#

RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/src/ruby-build
RUN cd /usr/local/src/ruby-build && ./install.sh

#
# Install ruby and bundler gem
#

RUN echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
RUN ruby-build 2.1.2 /usr/local
RUN gem update --system
RUN gem install bundler

#
# Clean up APT when done
#

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
