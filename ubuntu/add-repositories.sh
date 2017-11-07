#!/usr/bin/env bash
#
# Adds all custom ubuntu repositories

set -e

echo "> Installing wget..."
sudo apt-get -y install wget

echo "> Adding multiverse..."
sudo add-apt-repository multiverse

echo "> Adding Atom repo..."
sudo add-apt-repository ppa:webupd8team/atom
