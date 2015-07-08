#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

# human readable name for the package
name="jenv"

user="${default_user}"

log_info "Installing ${name} for user ${user}"

sudo -Hn su - "${user}" <<EOF
git clone https://github.com/gcuisinier/jenv.git ~/.jenv

echo 'export PATH="\$HOME/.jenv/bin:\$PATH"' >> ~/.profile
echo 'eval "\$(jenv init -)"' >> ~/.profile

source ~/.profile

for file in /opt/oracle/jdk*
do
  if [[ -d "\${file}" && ! -L "\${file}" ]]; then
    jenv add "\${file}"
  fi
done

jenv global 1.7

jenv enable-plugin maven
EOF
