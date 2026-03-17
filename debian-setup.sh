#!/usr/bin/env bash

## Installation:
# only choose ssh server and standard system utilities
# no root password = sudo installed by default + new user is in the sudo group


# wget johanyim.com/setup

sudo apt install -y git neovim zsh zsh-syntax-highlighting ssh openssh-server man-db tmux stow openssl curl pkgconf alacritty brightnessctl libnotify-bin clang npm unzip fonts-noto waybar starship fzf stow

# install rust (if it doesn't exist already)
if ! [[ -x "$(command -v cargo)" ]]; then 
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi 



# docker kubernetes

# change default shell 
if ! [[ $SHELL == "/usr/bin/zsh" ]]; then
	chsh -s /usr/bin/zsh
fi

# start the ssh daemon
sudo systemctl enable sshd
sudo systemctl start sshd


# setup ssh with passwordless login
mkdir $HOME/.ssh
touch $HOME/.ssh/authorized_keys
printf "Linux:\nssh-copy-id $USER@$HOSTNAME\n\nWindows:\ntype C:\\\Users\\jyim\\.ssh\\id_ed25519.pub | ssh $USER@$HOSTNAME \"cat >> ~/.ssh/authorized_keys\"\n
"

# generate ssh public keys for git with ssh-keygen
if ! [[ -f  "$HOME/.ssh/id_ed25519" ]]; then 
	ssh-keygen -q -t ed25519 -N '' -f "$HOME/.ssh/id_ed25519"
fi


# setup fonts
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/DepartureMono.tar.xz
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Noto.tar.xz


# unzip NotoSans.zip -d NotoSans
# mkdir -p ~/.local/share/fonts
# cp ./NotoSans/*.ttf ~/.local/share/fonts/
fc-cache -fv




# install rust (if it doesn't exist already)
if ! [[ -x "$(command -v cargo)" ]]; then 
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi 




# install mako

# install bottom

# rofi-wayland 


# install zoxide eza starship


# install librewolf from backports
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf && sudo extrepo update librewolf
sudo apt update && sudo apt install librewolf -y
