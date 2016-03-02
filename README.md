# vagrant-boxes-centos
Build [Vagrant](http://www.vagrantup.com) Ubuntu boxes with [Packer](http://packer.io)
and publish them to [Atlas](https://atlas.hashicorp.com)

Based on [Hashicorp tutorial](https://github.com/hashicorp/atlas-packer-vagrant-tutorial)

## Requirements ##
* Packer
* VirtualBox >= 4.3.26
* Environment variables
  * `ATLAS_USERNAME`: the Atlas user name
  * `ATLAS_TOKEN`: the authorisation token obtained from Atlas
