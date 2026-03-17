#!/usr/bin/env bash

## Installation:
# only choose ssh server and standard system utilities
# no root password = sudo installed by default + new user is in the sudo group


# wget johanyim.com/setup

sudo apt install git neovim zsh zsh-syntax-highlighting ssh openssh-server man-db tmux firefox stow openssl pkgconf alacritty brightnessctl libnotify-bin clang npm unzip zoxide eza fonts-noto waybar starship fzf firefox stow

# docker kubernetes



# setup noto fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NotoSans.zip
unzip NotoSans.zip -d NotoSans
mkdir -p ~/.local/share/fonts
cp ./NotoSans/*.ttf ~/.local/share/fonts/
fc-cache -fv
rm -rf NotoSans




# install mako

# install bottom

# rofi-wayland 


# install zoxide eza starship


# install librewolf from backports
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf && sudo extrepo update librewolf
sudo apt update && sudo apt install librewolf -y
