#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

perl -p -i -e 's#http://us.archive.ubuntu.com/ubuntu#http://mirror.rackspace.com/ubuntu#gi' /etc/apt/sources.list

# Update the box
apt-get -y update
apt-get -y install facter linux-headers-$(uname -r) build-essential zlib1g-dev libssl-dev libreadline-gplv2-dev curl unzip python-minimal

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove 5s grub timeout to speed up booting
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=0
GRUB_HIDDEN_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="console=tty1 console=tty0 net.ifnames=0"
GRUB_CMDLINE_LINUX=""
EOF

update-grub
