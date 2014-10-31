#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

# user name
user="celestia"
password="We are gathered here today to once again honor the heroism of these six friends who stood up to the villain Discord and saved Equestria from eternal chaos."

# GECOS field (comma-separated)
# Full name, Building and room number, Phone number, Other contact information
gecos="Princess Celestia,,,"

# primary group
primary_group="root"

# default shell
shell="/bin/bash"

if [ ! "$(id "${user}" 2>/dev/null)" ]
then
    log_info "Configuring user ${user}"
    sudo /usr/sbin/useradd -d /root -c "${gecos}" -g "${primary_group}" -M -N -o -r -s "${shell}" -u 0 "${user}"

    log_debug "Setting password for ${user}..."
    echo "${user}:${password}" | sudo /usr/sbin/chpasswd

    log_debug "Lock out root user since ${user} is root now..."
    sudo /usr/sbin/usermod -s /sbin/nologin -L root
fi
