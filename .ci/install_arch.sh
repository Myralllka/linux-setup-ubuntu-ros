#!/bin/bash

set -e

find ./ -type f -exec sed -i -e 's/sudo pacman/pacman/g' {} \;
find ./ -type f -exec sed -i -e 's/\(^.*yay.*$\)//g' {} \;

pacman --noconfirm -S git

echo "running the main install.sh"

./install.sh

echo "install part ended"
