#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

version=$1
user="${default_user}"

# human readable name for the package
name="Node.js ${version}"

# file name for tar
base_name="node-v${version}-linux-x64"
package="${base_name}.tar.gz"

# target directory
target="/opt/joyent/"
install_path="${target}${base_name}"

# command for the installer (eg. zypper install, pip install, gem install)
installer=(tar -xzf)

origin="/tmp/data/${package}"

if [ -f $origin ]
then
  log_info "Installing ${name} from ${origin}"
  sudo mkdir -p "${target}"
  sudo "${installer[@]}" "${origin}" -C "${target}"
  sudo chown -R "${user}:users" "${target}"

  priority="500"

  sudo update-alternatives --install /usr/bin/node node "${install_path}/bin/node" "${priority}" \
       --slave /usr/bin/npm npm "${install_path}/bin/npm"
fi
