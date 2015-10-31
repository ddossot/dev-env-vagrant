# Development Environment (vagrant)

This repository contains the basic provisioning requirements for my development environment.

Prerequisites:
- VirtualBox
- vagrant
- `vagrant plugin install vagrant-vbguest`


## Non-APT Software

The installation scripts do not download non-APT applications to speed up the creation and recreation of the environment.
This means that the required software need to be manually downloaded first prior to creating the image.

For this create a `data` directory under the clone point and download files in it.
If you use the scripts as is, you will need to download the following:

- apache-maven-3.3.3-bin.tar.gz
- jdk-6u45-linux-x64.tar.gz
- jdk-7u79-linux-x64.tar.gz
- jdk-8u60-linux-x64.tar.gz
- jq-1.4-linux-x64
- node-v0.12.3-linux-x64.tar.gz

The author uses a DropBox directory to store these files and sync them with the `data` directory.


## Custom Configuration

Copy your alias, config ... files to `home/default`

For information, here is a tree view of the author's config files:

    home/default
    ├── .bash_aliases
    ├── .gitconfig
    ├── .m2
    │   └── settings.xml
    └── .ssh
        └── config

## Usage

- Create the box with `vagrant up` then use it with `vagrant reload`
- Configure the proper `bridge` interface in `config.vm.network "public_network"` to prevent being prompted on every start
- Configure your host `~/.ssh/config` with:
```
Host localhost
  Port 2222
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
```
  to allow jumping in your dev-env with `ssh localhost`
- Symlink `~/dev/maven/repository` to `~/.m2/repository` so the Maven
  repository is shared between with the host (to support IDEs like Eclipse).

## TODO

- Install AWS cli

