#!/bin/bash

set -e

ROS_DISTRO="noetic"

sudo apt-get -y install git

echo "running the main install.sh"

./install.sh --unattended

echo "install part ended"
