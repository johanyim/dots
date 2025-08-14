#!/usr/bin/env bash

DOTFILES_REPO="https://github.com/johanyim/.dotfiles.git"

# install all packages
sudo pacman --noconfirm --needed -Syu git nvim alacritty base-devel brightnessctl bottom libnotify mako man clang npm unzip bob zsh zsh-syntax-highlighting zoxide eza noto-fonts ttf-noto-nerd openssl pkgconf rofi-wayland tmux waybar starship fzf firefox stow

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

# install yay (if it doesn't exist already)
if ! [[ -x "$(command -v yay)" ]]; then 
	sh -c "
	git clone https://aur.archlinux.org/yay.git &&
	cd yay &&
	makepkg -si --noconfirm &&
	cd .. &&
	rm -rf ./yay
	"
fi

# install aur packages
yay --noconfirm --needed -S otf-departure-mono zsh-vi-mode


# install rust (if it doesn't exist already)
if ! [[ -x "$(command -v cargo)" ]]; then 
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi 


# configure git
git config --global user.name "johanyim"
git config --global user.email "johanjyyim@gmail.com"


# clone dotfiles from git
git clone $DOTFILES_REPO

# use bob to configure version of neovim
touch "$HOME/.bash_profile"
bob use nightly


stow .








