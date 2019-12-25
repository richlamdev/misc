#!/bin/bash

wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -

echo deb https://deb.opera.com/opera-stable/ stable non-free | sudo tee /etc/apt/sources.list.d/opera.list

sudo apt update
sudo apt install opera-stable
