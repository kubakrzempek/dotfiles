#!/usr/bin/env bash
#
# Installs all the ubuntu packages through Aptfile

set -e

install_packages () {
  local packagelist="$(dirname "$0")/../Aptfile"
  echo "> Installing packages..."
  xargs -a <(awk '/^\s*[^#]/' "$packagelist") -r -- sudo apt-get -y install
}

add_repositories () {
  echo "> Adding multiverse..."
  sudo add-apt-repository multiverse
  echo "> Adding VirtualBox repo..."
  echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
  echo "> Adding Atom repo..."
  sudo add-apt-repository ppa:webupd8team/atom
}

update () {
  echo "> Updating apt-get..."
  sudo apt-get update
}

upgrade () {
  echo "> Upgrading distro..."
  sudo apt-get -y dist-upgrade
}

cleanup () {
  echo "> Cleaning up..."
  sudo apt-get -y autoremove
  sudo apt-get -y autoclean
}

echo "> Installing wget..."
sudo apt-get -y install wget


add_repositories
update
upgrade
install_packages
cleanup
