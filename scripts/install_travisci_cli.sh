#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

version=$1

# human readable name for the package
name="TravisCI Client ${version}"

user="${default_user}"

log_info "Installing ${name} for user ${user}"

sudo -Hn su - "${user}" <<EOF
gem install travis -v "${version}" --no-rdoc --no-ri
EOF
