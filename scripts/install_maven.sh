#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

version=$1
user="${default_user}"

# human readable name for the package
name="Maven ${version}"

# file name for tar
base_name="apache-maven-${version}"
package="${base_name}-bin.tar.gz"

# target directory
target="/opt/apache/"
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

  sudo update-alternatives --install /usr/bin/mvn mvn "${install_path}/bin/mvn" "${priority}" \
       --slave /usr/bin/mvnDebug mvnDebug "${install_path}/bin/mvnDebug" \
       --slave /usr/bin/mvnyjp mvnyjp "${install_path}/bin/mvnyjp"
fi
