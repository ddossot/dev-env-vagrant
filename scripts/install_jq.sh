#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

version=$1
user="${default_user}"

# human readable name for the package
name="jq ${version}"

# file name for tar
package="jq-${version}-linux-x64"

# target directory
target="/home/${user}/bin"
link="jq"

# command for the installer (eg. zypper install, pip install, gem install)
installer=(cp)

origin="/tmp/data/${package}"

if [ -f $origin ]
then
  log_info "Installing ${name} from ${origin}"
  sudo mkdir -p "${target}"
  sudo "${installer[@]}" "${origin}" "${target}"
  sudo chmod +x "${target}/${package}"
  sudo ln -s "${target}/${package}" "${target}/${link}"
  sudo chown -R "${user}:users" "${target}"
fi
