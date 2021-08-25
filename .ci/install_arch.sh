#!/bin/bash

set -e

sudo pacman -S git

echo "running the main install.sh"

./install.sh --unattended

echo "install part ended"
