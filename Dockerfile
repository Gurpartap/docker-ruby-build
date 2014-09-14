FROM ubuntu:14.04.1

MAINTAINER Gurpartap Singh <hi@gurpartap.com>

# Setup basic environment variables and suppress locale warnings
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8 ;\
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale ;\
    dpkg-reconfigure locales

RUN apt-get update && \
    # Install tools & libs to compile ruby \
    apt-get install -y --force-yes build-essential curl git-core libffi-dev libgdbm-dev libncurses5-dev libreadline-dev libssl-dev libtool libyaml-dev zlib1g-dev && \
    # Clean up APT when done \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    # Install ruby-build \
    git clone https://github.com/sstephenson/ruby-build.git /usr/local/src/ruby-build && \
    cd /usr/local/src/ruby-build && \
    ./install.sh && \
    # Install ruby and bundler gem \
    echo "gem: --no-rdoc --no-ri" >> ~/.gemrc && \
    ruby-build 2.1.2 /usr/local && \
    gem update --system && \
    gem install bundler
