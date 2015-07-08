#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

version=$1
user="${default_user}"

# human readable name for the package
name="JDK ${version}"

# file name for tar
package="jdk-${version}-linux-x64.tar.gz"

# target directory
target="/opt/oracle/"

# command for the installer (eg. zypper install, pip install, gem install)
installer=(tar -xzf)

origin="/tmp/data/${package}"

if [ -f $origin ]
then
    log_info "Installing ${name} from ${origin}"
    sudo mkdir -p "${target}"
    sudo "${installer[@]}" "${origin}" -C "${target}"
    sudo chown -R "${user}:users" "${target}"
fi
