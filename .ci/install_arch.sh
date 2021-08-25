#!/bin/bash

set -e

pacman --noconfirm -S git

echo "running the main install.sh"

./install.sh --unattended

echo "install part ended"
