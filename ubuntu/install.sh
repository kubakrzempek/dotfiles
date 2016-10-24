#!/usr/bin/env bash
#
# Installs all the ubuntu packages through Aptfile

set -e

install_packages () {
  local packagelist="$(dirname "$0")/../Aptfile"
  echo "> Installing packages..."
  xargs -a <(awk '/^\s*[^#]/' "$packagelist") -r -- sudo apt-get -y install
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

update
upgrade
install_packages
cleanup

sudo tlp start
