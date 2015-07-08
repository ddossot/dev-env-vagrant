#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

log_info "Installing dev tools"

sudo apt-get install -y \
     build-essential \
     ack-grep \
     git \
     tree \
     rcconf \
     traceroute \
     apache2-utils \
     pandoc \
     libssl-dev zlibc libxml2-dev
