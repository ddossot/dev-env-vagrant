#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

# human readable name for the package
name="rbenv"

user="${default_user}"

log_info "Installing ${name} for user ${user}"

sudo -Hn su - "${user}" <<EOF
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="\$HOME/.rbenv/bin:\$PATH"' >> ~/.profile
echo 'eval "\$(rbenv init -)"' >> ~/.profile

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
EOF
