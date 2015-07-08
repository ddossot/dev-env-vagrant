#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

log_info "Refreshing apt repositories"
sudo apt-get update
