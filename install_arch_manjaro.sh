#!/bin/bash

# update the system
sudo pacman -Suy

subinstall_params=""
unattended=0

for param in "$@"
do
	echo $param
	if [ $param="--unattended"  ]; then
		echo "installing in unattended mode"
		unattended=1
		subinstall_params="--unattended"
	fi
done

# graphics
sudo pacman -S xorg-server xorg-xinit xorg-apps mesa-libgl xterm

# base
sudo pacman -S git curl wget ncurses arm-none-eabi-gcc blueberry i3-gaps

# install yay 
git clone https://aur.archlinux.org/yay.git /tmp/yay; cd /tmp/yay; makepkg -si; cd -;

echo "
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
" >> /etc/pacman.conf

yay -S ipython jupyter-console powerline edex-ui

yay -S gnome sddm ruby sl gparted espeak google-chrome slack chrome-gnome-shell classroom-assistant clion zoom telegram-desktop checkupdates-aur perl-anyevent perl-anyevent-i3

if [ "$unattended" == "0" ]
then
	if [ "$?" != "0" ]; then echo "Press Enter to continues... " && read; fi
fi

# install TMUX
bash $APPCONFIG_PATH/tmux/install.sh $subinstall_params

