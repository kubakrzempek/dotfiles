#!/usr/bin/env bash
#
# Adds all custom ubuntu repositories

set -e

echo "> Installing wget..."
sudo apt-get -y install wget

echo "> Adding multiverse..."
sudo add-apt-repository multiverse

echo "> Adding VirtualBox repo..."
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

echo "> Adding Atom repo..."
sudo add-apt-repository ppa:webupd8team/atom
