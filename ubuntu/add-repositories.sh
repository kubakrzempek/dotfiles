#!/usr/bin/env bash
#
# Adds all custom ubuntu repositories

set -e

echo "> Installing wget..."
sudo apt-get -y install wget

echo "> Adding multiverse..."
sudo add-apt-repository multiverse

echo "> Adding PostgreSQL repo..."
echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

echo "> Adding Atom repo..."
echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" | sudo tee /etc/apt/sources.list.d/atom.list
wget --quiet -O - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -

echo "> Addin Heroku repo..."
echo "deb https://cli-assets.heroku.com/apt ./" | sudo tee /etc/apt/sources.list.d/heroku.list
wget --quiet -O - https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
