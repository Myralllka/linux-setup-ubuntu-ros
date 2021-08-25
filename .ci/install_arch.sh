#!/bin/bash

set -e

find ./ -type f -exec sed -i -e 's/sudo pacman/pacman/g' {} \;

pacman --noconfirm -S git

echo "running the main install.sh"

./install.sh --unattended

echo "install part ended"
