# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

DEFAULT_USER = "kadeem"
PROVISIONED = File.file?(".vagrant/machines/default/virtualbox/id")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    if PROVISIONED
        config.ssh.username = "#{DEFAULT_USER}"
        config.ssh.private_key_path = "~/.ssh/id_rsa"
    end

    config.vm.box = "com.kadeem/harlequin64"
    config.vm.guest = :suse
    # config.vm.network "forwarded_port", guest: 80, host: 8080
    # config.vm.network "public_network"
    config.ssh.forward_agent = true
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provider "virtualbox" do |vb|
        vb.cpus = 4
        vb.memory = 3072
    end

    unless PROVISIONED
        config.vm.hostname = "ponyville.equestria"

        config.vm.provision "shell", inline: "echo $* >/tmp/DEFAULT_USER", args: "#{DEFAULT_USER}", privileged: false

        config.vm.provision "file", source: "scripts/common.sh", destination: "/tmp/vagrant/common.sh"

        config.vm.provision "file", source: "etc/motd", destination: "/tmp/root/etc/motd"
        # config.vm.provision "file", source: "etc/init.d", destination: "/tmp/root/etc/init.d"
        config.vm.provision "file", source: "etc/skel", destination: "/tmp/root/etc/skel"
        config.vm.provision "shell", path: "scripts/init.sh"

        config.vm.provision "shell", path: "scripts/install_update_repos.sh"

        config.vm.provision "shell", path: "scripts/group_topsecret.sh"
        config.vm.provision "shell", path: "scripts/group_secret.sh"
        config.vm.provision "shell", path: "scripts/group_confidential.sh"
        config.vm.provision "shell", path: "scripts/group_restricted.sh"
        config.vm.provision "shell", path: "scripts/group_unclassified.sh"

        config.vm.provision "shell", path: "scripts/user_celestia.sh"
        config.vm.provision "shell", path: "scripts/user_luna.sh"
        config.vm.provision "shell", path: "scripts/user_cadence.sh"
        config.vm.provision "shell", path: "scripts/user_twilight_sparkle.sh"
        config.vm.provision "shell", path: "scripts/user_spike.sh"
        config.vm.provision "shell", path: "scripts/user_pinkie_pie.sh"
        config.vm.provision "shell", path: "scripts/user_applejack.sh"
        config.vm.provision "shell", path: "scripts/user_rainbow_dash.sh"
        config.vm.provision "shell", path: "scripts/user_rarity.sh"
        config.vm.provision "shell", path: "scripts/user_fluttershy.sh"

        config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "/tmp/root/home/#{DEFAULT_USER}/.ssh/id_rsa"
        config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/root/home/#{DEFAULT_USER}/.ssh/id_rsa.pub"
        config.vm.provision "shell", path: "scripts/user_default.sh"

        config.vm.provision "file", source: "etc/sudoers", destination: "/tmp/root/etc/sudoers"
        config.vm.provision "shell", path: "scripts/end.sh"
    end
end
