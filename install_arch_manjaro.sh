#!/bin/bash

# update the system
sudo pacman -Suy --noconfirm

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
sudo pacman -S xorg-server xorg-xinit xorg-apps mesa-libgl xterm --noconfirm


# base
sudo pacman -S git curl wget ncurses arm-none-eabi-gcc blueberry --noconfirm


# install yay 
git clone https://aur.archlinux.org/yay.git /tmp/yay; cd /tmp/yay; makepkg -si; cd -;

#echo "
#[archlinuxfr]
#SigLevel = Never
#Server = http://repo.archlinux.fr/$arch
#" >> /etc/pacman.conf

sudo pacman -Sy

yay -S ipython jupyter-console powerline edex-ui ruby-colorls --noconfirm 

yay -S gnome sddm ruby sl gparted espeak google-chrome slack chrome-gnome-shell classroom-assistant clion zoom telegram-desktop checkupdates-systemd-git perl-anyevent perl-anyevent-i3 --noconfirm

if [ "$unattended" == "0" ]
then
	if [ "$?" != "0" ]; then echo "Press Enter to continues... " && read; fi
fi

# install TMUX
# bash $APPCONFIG_PATH/tmux/install.sh $subinstall_params
sudo pacman -S tmux --noconfirm

# install RANGER
sudo pacman -S ranger --noconfirm

# install VIM
sudo pacman -S vim --noconfirm

# install HTOP-VIM
yay -S htop-vim --noconfirm
yay -S ytop --noconfirm

# install URXVT

# install FONTS POWERLINE

# install NVIM

# install ZSH
sudo pacman -S zsh --noconfirm
# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

export ./appconfig/zsh/install_autosuggestion_plugin.sh
export ./appconfig/zsh/install_k_plugin.sh
export ./appconfig/zsh/install_syntax_plugin.sh
export ./appconfig/zsh/install_z_plugin.sh

# install i3
sudo pacman -S i3 i3-gaps --noconfirm
yay -S polybar

# install LATEX and PDF support

# install FZF

# install TMUXINATOR
yay -S tmuxinator --noconfirm


