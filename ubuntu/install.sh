#!/usr/bin/env bash
#
# Installs all the ubuntu packages through Aptfile

set -e

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
cleanup

sudo tlp start
