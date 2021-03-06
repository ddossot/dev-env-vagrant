#!/bin/bash -eu
source '/tmp/vagrant/common.sh'

# user name
user="${default_user}"
password="${user}"

# GECOS field (comma-separated)
# Full name, Building and room number, Phone number, Other contact information
gecos="${user^},,,"

# default shell
shell="/bin/bash"

if [ ! "$(id "${user}" 2>/dev/null)" ]
then
    log_info "Configuring user ${user}"
    sudo /usr/sbin/useradd -c "${gecos}" -m -s "${shell}" "${user}"
    sudo /usr/sbin/usermod -aG sudo "${user}"

    log_debug "Creating user files..."
    if [ -d "/tmp/root/home/${user}" ]
    then
        sudo chown -R "${user}:$(id -gn "${user}")" "/tmp/root/home/${user}"
        for user_file in $(find "/tmp/root/home/${user}" -type f)
        do
            log_debug "Creating ${user_file:9}..."
            create_file_user "${user}" "${user_file}" "${user_file:9}"
        done
        sudo rm -rf "/tmp/root/home/${user}"
    fi

    if [ -d "/home/${user}/.ssh/" ]
    then
        log_debug "Configuring authorized_keys..."
        sudo -u "${user}" chmod 0700 "/home/${user}/.ssh/"
        if [ -f "/home/${user}/.ssh/id_rsa.pub" ]
        then
            sudo -u "${user}" cp "/home/${user}/.ssh/id_rsa.pub" "/home/${user}/.ssh/authorized_keys"
        fi
        if [ -f "/home/${user}/.ssh/authorized_keys" ]
        then
            sudo -u "${user}" chmod 0600 "/home/${user}/.ssh/authorized_keys"
        fi
    fi

    log_debug "Setting password for ${user}..."
    echo "${user}:${password}" | sudo /usr/sbin/chpasswd
fi
