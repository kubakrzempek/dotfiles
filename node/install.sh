#!/usr/bin/env bash
#
# Installs n to manage node dependencies

set -e

N_DIR="$HOME/.n"

install_n () {
  if [ -d "$N_DIR" ]; then
    echo "> Updating N..."
    cd "$N_DIR"
    git pull
  else
    echo "> Cloning N..."
    git clone git@github.com:tj/n.git "$N_DIR"
    cd "$N_DIR"
  fi
  echo "> Compiling..."
  sudo make install
}

install_n
