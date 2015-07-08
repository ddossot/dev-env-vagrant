# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

require 'etc'
DEFAULT_USER = Etc.getlogin
PROVISIONED = File.file?(".vagrant/machines/default/virtualbox/id")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  if PROVISIONED
    config.ssh.username = DEFAULT_USER
    config.ssh.private_key_path = "~/.ssh/id_rsa"
    config.vm.synced_folder "~/dev", "/home/#{DEFAULT_USER}/dev", create: true
  end

  config.vm.box = "ubuntu/trusty64"
  config.vm.guest = :ubuntu
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "public_network"
  config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = 2048
  end
  config.vm.hostname = "development.vagrant"

  config.vm.provision "shell", inline: "echo $* >/tmp/DEFAULT_USER", args: DEFAULT_USER, privileged: false

  config.vm.provision "file", source: "scripts/common.sh", destination: "/tmp/vagrant/common.sh"

  # config.vm.provision "file", source: "etc/motd", destination: "/tmp/root/etc/motd"
  config.vm.provision "file", source: "etc/skel", destination: "/tmp/root/etc/skel"
  config.vm.provision "shell", path: "scripts/init.sh"

  config.vm.provision "shell", path: "scripts/install_update_repos.sh"

  config.vm.provision "file", source: "home/default", destination: "/tmp/root/home/#{DEFAULT_USER}"
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "/tmp/root/home/#{DEFAULT_USER}/.ssh/id_rsa"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/root/home/#{DEFAULT_USER}/.ssh/id_rsa.pub"
  config.vm.provision "shell", path: "scripts/user_default.sh"

  # Custom installers -------
  config.vm.provision "file", source: "data", destination: "/tmp"
  config.vm.provision "shell", path: "scripts/install_dev_tools.sh"
  config.vm.provision "shell", path: "scripts/install_jq.sh", args: "1.4"
  config.vm.provision "shell", path: "scripts/install_jdk.sh", args: "6u45"
  config.vm.provision "shell", path: "scripts/install_jdk.sh", args: "7u79"
  config.vm.provision "shell", path: "scripts/install_jdk.sh", args: "8u45"
  config.vm.provision "shell", path: "scripts/install_maven.sh", args: "3.3.3"
  config.vm.provision "shell", path: "scripts/install_node.sh", args: "0.12.3"
  config.vm.provision "shell", path: "scripts/install_jenv.sh"
  config.vm.provision "shell", path: "scripts/install_lein.sh"
  config.vm.provision "shell", path: "scripts/install_rbenv.sh"
  config.vm.provision "shell", path: "scripts/install_ruby.sh", args: "2.2.2"
  config.vm.provision "shell", path: "scripts/install_travisci_cli.sh", args: "1.7.6"
  config.vm.provision "shell", path: "scripts/install_pyenv.sh"
  config.vm.provision "shell", path: "scripts/install_docker.sh"
  config.vm.provision "shell", path: "scripts/install_docker_compose.sh", args: "1.2.0"
  # -------------------------

  config.vm.provision "file", source: "etc/sudoers", destination: "/tmp/root/etc/sudoers"
  config.vm.provision "shell", path: "scripts/end.sh"
end
