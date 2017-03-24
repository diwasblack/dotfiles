#!/bin/bash

# Check if script is running as sudo
if [ "$EUID" -eq 0 ]
  then echo "Run script without sudo"
  exit
fi

echo -e "\n############ Updating submodules ############"
git submodule init
git submodule update

echo -e "\n############ Updating package lists ############"
sudo apt update

echo -e "\n############ Installing tmux and zsh ############"
sudo apt install tmux zsh

# Check if curl is installed
if ! command -v curl > /dev/null 2>&1; then
    echo -e "\n############ Installing curl ############"
    sudo apt-get install curl
fi

echo -e "\n############ Install antibody for zsh ############"
curl -sL https://git.io/antibody | bash -s

if ! command -v gem > /dev/null 2>&1; then
    echo -e "\n############ Installing ruby ############"
    sudo apt install ruby
fi

echo -e "\n############ Installing tmuxinator ############"
sudo gem install tmuxinator

# Install pip if not present
if [ ! -f /usr/bin/pip3 ]; then
    echo -e "\n############ Installing pip for python3 ############"
    sudo apt install python3-pip
fi

echo -e "\n############ Installing powerline ############"
sudo -H /usr/bin/pip3 install powerline-status

echo -e "\n############ Installing fontface hack ############"
# Supports powerline symbols
sudo apt install fonts-hack-ttf

echo -e "\n############ Installing silver searcher ############"
sudo apt install silversearcher-ag

echo -e "\n############ Installing neovim ############"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

echo -e "\n############ Downloading vim-plug ############"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "\n############ Installing python libraries ############"
sudo -H /usr/bin/pip3 install psutil
sudo -H /usr/bin/pip3 install neovim
sudo -H /usr/bin/pip3 install flake8
sudo -H /usr/bin/pip3 install autopep8
sudo -H /usr/bin/pip3 install jedi

# Check if GNU stow is installed
if ! command -v stow > /dev/null 2>&1; then
    echo -e "\n############ Installing GNU stow ############"
    sudo apt install stow
fi

# Link dotfiles
stow bash zsh tmux powerline neovim
