#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

version=$1

# human readable name for the package
name="Ruby MRI ${version}"

user="${default_user}"

log_info "Installing ${name} for user ${user}"

sudo -Hn su - "${user}" <<EOF
rbenv install "${version}"
rbenv rehash
rbenv global "${version}"
ruby -v
EOF
