#!/usr/bin/env bash
#
# Installs rbenv, rbenv-vars, and rbenv-build

set -e

RBENV_DIR="$HOME/.rbenv"

install_rbenv () {
  if [ -d "$RBENV_DIR" ]; then
    echo "> updating rbenv..."
    cd "$RBENV_DIR"
    git pull
  else
    echo "> cloning rbenv..."
    git clone https://github.com/rbenv/rbenv.git "$RBENV_DIR"
    cd "$RBENV_DIR"
  fi
  echo "> compiling dynamic bash..."
  src/configure && make -C src
}

install_rbenv_build () {
  local rbenv_build="$RBENV_DIR/plugins/ruby-build"
  if [ -d "$rbenv_build" ]; then
    echo "> updating rbenv-build..."
    cd "$rbenv_build"
    git pull
  else
    echo "> cloning rbenv-build..."
    git clone https://github.com/rbenv/ruby-build.git "$rbenv_build"
  fi
}

install_rbenv_vars () {
  local rbenv_vars="$RBENV_DIR/plugins/rbenv-vars"
  if [ -d "$rbenv_vars" ]; then
    echo "> updating rbenv-vars..."
    cd "$rbenv_vars"
    git pull
  else
    echo "> cloning rbenv-vars..."
    git clone https://github.com/rbenv/rbenv-vars.git "$rbenv_vars"
  fi
}

install_rbenv
install_rbenv_build
install_rbenv_vars
