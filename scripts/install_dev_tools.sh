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
     texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended \
     libssl-dev zlibc libxml2-dev libreadline-dev \
     unzip \
     libxml2-utils
