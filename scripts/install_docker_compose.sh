#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

# human readable name for the package
name="docker-compose"
version=$1

user="${default_user}"

log_info "Installing ${name} version ${version}"

target="/home/${user}/bin"
sudo mkdir -p "${target}"

script="${target}/docker-compose"

curl -L https://github.com/docker/compose/releases/download/${version}/docker-compose-`uname -s`-`uname -m` > "${script}"
chmod +x "${script}"

sudo chown -R "${user}:users" "${target}"
