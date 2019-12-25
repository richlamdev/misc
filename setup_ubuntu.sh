#!/bin/bash
# 
# Basic setup script for Desktop Ubuntu installation.
# Based on Ubuntu 18.04 LTS Desktop

# bootstrap - run following commands first, before this script.
#
#git needs to be installed before contining
#sudo apt install git
#cd /home/$USER
#git clone http://www.github.com/richlamdev/misc
#cd misc

# Load default vimrc settings
cp .vimrc ..

# Load default desktop settings
# if needed, save settings first
#dconf dump / > dconf-settings.ini
dconf load / < dconf-settings.ini

# Install software
sudo apt update
sudo apt install vim tmux ufw nmap tcpdump exfat-fuse exfat-utils net-tools openssh-server p7zip -y

# Disable IPv6
sudo sed -e '/GRUB_CMDLINE_LINUX_DEFAULT=/ s/^#*/#/' -i_backup /etc/default/grub
#sudo sed -e '/GRUB_CMDLINE_LINUX=/ s/^#*/#/' -i_backup /etc/default/grub
sudo sed -e '/GRUB_CMDLINE_LINUX_DEFAULT=/ a\GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ipv6.disable=1"' -i_backup /etc/default/grub
#sudo sed -e '/GRUB_CMDLINE_LINUX=/ a\GRUB_CMDLINE_LINUX="ipv6.disable=1"' -i_backup /etc/default/grub
sudo update-grub2

# Configure SSH Server
sudo sed -e '/AddressFamily/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sudo sed -e '/AddressFamily/ a\AddressFamily\ inet' -i_backup /etc/ssh/sshd_config
sudo sed -e '/X11Forwarding\ yes/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sudo sed -e '/X11Forwarding\ yes/ a\X11Forwarding\ no' -i_backup /etc/ssh/sshd_config
sudo sed -e '/PermitRootLogin\ prohibit-password/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sudo sed -e '/PermitRootLogin\ prohibit-password/ a\PermitRootLogin no' -i_backup /etc/ssh/sshd_config

# Set SSH as only available service 
sudo ufw limit 22/tcp

# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable

# Start OpenSSH Server
sudo systemctl enable ssh

# Disable/Remove useless software
# Enable the GUI Startup Applications to display all hidden apps.
# Run Startup Applications, then disable backup monitor, desktop sharing, orca screen reader
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

sudo systemctl disable avahi-daemon
sudo chmod -x /usr/lib/evolution/evolution-calendar-factory
sudo apt purge gnome-software
sudo apt purge gnome-software-common
sudo apt purge snapd ubuntu-core-launcher squashfs-tools

sudo apt install gnome-calculator gnome-logs gnome-characters gnome-system-monitor
