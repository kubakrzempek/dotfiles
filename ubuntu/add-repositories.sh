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

echo "> Adding PostgreSQL repo..."
echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
