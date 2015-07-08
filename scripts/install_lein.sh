#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

user="${default_user}"

# human readable name for the package
name="leiningen"

# target directory
target="/home/${user}/bin"
script="${target}/lein"

sudo mkdir -p "${target}"

log_info "Installing ${name} for ${user}"
wget -q -O "${script}" https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
sudo chmod a+x "${script}"
sudo chown -R "${user}:users" "${script}"

sudo -Hn su - "${user}" -c "${script}"
