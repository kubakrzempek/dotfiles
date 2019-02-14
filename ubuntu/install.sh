#!/usr/bin/env bash
#
# Installs all the ubuntu packages through Aptfile

set -e

update () {
  echo "> Updating apt-get..."
  sudo apt update
}

upgrade () {
  echo "> Installing, updating packages..."
  sudo apt -y full-upgrade
}

cleanup () {
  echo "> Cleaning up..."
  sudo apt -y autoremove
  sudo apt-get -y autoclean
}

update
upgrade
cleanup

sudo tlp start
