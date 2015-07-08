#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

# human readable name for the package
name="docker"

user="${default_user}"

log_info "Downloading ${name}"
installer="/tmp/install-${name}.sh"
wget -q -O "${installer}" https://get.docker.com/

log_info "Installing ${name} with ${installer}"
sudo chmod a+x "${installer}"
sudo "${installer}"

sudo usermod -aG docker "${user}"

log_info "Testing ${name}"
sudo docker run hello-world

rm "${installer}"
