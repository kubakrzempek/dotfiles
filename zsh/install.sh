#!/usr/bin/env bash
#
# Sets up ZSH as default shell

set -e

echo "> Making ZSH default shell"
chsh -s $(which zsh)
