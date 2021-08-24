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
sudo pacman -S git curl wget ncurses arm-none-eabi-gcc blueberry 

# install yay 
git clone https://aur.archlinux.org/yay.git /tmp/yay; cd /tmp/yay; makepkg -si; cd -;

echo "
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
" >> /etc/pacman.conf

yay -S ipython jupyter-console powerline edex-ui ruby-colorls

yay -S gnome sddm ruby sl gparted espeak google-chrome slack chrome-gnome-shell classroom-assistant clion zoom telegram-desktop checkupdates-systemd-git perl-anyevent perl-anyevent-i3

if [ "$unattended" == "0" ]
then
	if [ "$?" != "0" ]; then echo "Press Enter to continues... " && read; fi
fi

# install TMUX
# bash $APPCONFIG_PATH/tmux/install.sh $subinstall_params
sudo pacman -S tmux

# install RANGER
sudo pacman -S ranger

# install VIM
sudo pacman -S vim

# install HTOP-VIM
yay -S htop-vim
yay -S ytop

# install URXVT

# install FONTS POWERLINE

# install NVIM

# install ZSH
yay -S zsh 
# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

export ./appconfig/zsh/install_autosuggestion_plugin.sh
export ./appconfig/zsh/install_k_plugin.sh
export ./appconfig/zsh/install_syntax_plugin.sh
export ./appconfig/zsh/install_z_plugin.sh

# install i3
yay -S i3 i3-gaps polybar

# install LATEX and PDF support

# install FZF

# install TMUXINATOR
yay -S tmuxinator


