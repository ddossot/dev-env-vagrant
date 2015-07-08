#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

# human readable name for the package
name="pyenv"

user="${default_user}"

log_info "Installing ${name} for user ${user}"

sudo -Hn su - "${user}" <<EOF
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="\$HOME/.pyenv"' >> ~/.profile
echo 'export PATH="\$PYENV_ROOT/bin:\$PATH"' >> ~/.profile
echo 'eval "\$(pyenv init -)"' >> ~/.profile
EOF
