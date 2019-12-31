#!/bin/bash
# 
# Basic setup script for Kali Linux VMware installation.
# Created from Kali Linux 2019.4 - Xubuntu

# Load default vimrc settings
cp .vimrc ..

# Install software
apt update && dist-upgrade -y
apt install ufw gobuster html2text exiftool -y

# Update searchsploit
searchsploit -u

# Disable IPv6
sed -e '/GRUB_CMDLINE_LINUX_DEFAULT=/ s/^#*/#/' -i_backup /etc/default/grub
sed -e '/GRUB_CMDLINE_LINUX=/ s/^#*/#/' -i_backup /etc/default/grub
sed -e '/GRUB_CMDLINE_LINUX_DEFAULT=/ a\GRUB_CMDLINE_LINUX_DEFAULT="quiet ipv6.disable=1"' -i_backup /etc/default/grub
sed -e '/GRUB_CMDLINE_LINUX=/ a\GRUB_CMDLINE_LINUX="initrd=/install/initrd.gz ipv6.disable=1"' -i_backup /etc/default/grub
update-grub2

# Configure SSH Server
sed -e '/AddressFamily/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sed -e '/AddressFamily/ a\AddressFamily\ inet' -i_backup /etc/ssh/sshd_config
sed -e '/X11Forwarding\ yes/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sed -e '/X11Forwarding\ yes/ a\X11Forwarding\ no' -i_backup /etc/ssh/sshd_config
sed -e '/PermitRootLogin\ prohibit-password/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sed -e '/PermitRootLogin\ prohibit-password/ a\PermitRootLogin no' -i_backup /etc/ssh/sshd_config

# Set SSH as only available service 
#ufw limit 22/tcp
# Default: no ports available
ufw enable

# Start OpenSSH Server
#systemctl enable ssh
