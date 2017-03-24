#!/bin/bash

# Check if script is running as sudo
if [ "$EUID" -eq 0 ]
  then echo "Run script without sudo"
  exit
fi

echo "############ Updating submodules ############"
git submodule init
git submodule update

echo "############ Updating package lists ############"
sudo apt update

echo "############ Installing tmux and zsh ############"
sudo apt install tmux zsh

if ! command -v gem > /dev/null 2>&1; then
    echo "############ Installing ruby ############"
    sudo apt install ruby
fi

echo "############ Installing tmuxinator ############"
sudo gem install tmuxinator

# Install pip if not present
if [ ! -f /usr/bin/pip3 ]; then
    echo "############ Installing pip for python3 ############"
    sudo apt install python3-pip
fi

echo "############ Installing powerline ############"
sudo -H /usr/bin/pip3 install powerline-status

if ! command -v curl > /dev/null 2>&1; then
    echo "############ Installing curl ############"
    sudo apt-get install curl
fi

echo "############ Installing fontface hack ############"
# Supports powerline symbols
sudo apt install fonts-hack-ttf

echo "############ Installing silver searcher ############"
sudo apt install silversearcher-ag

echo "############ Installing neovim ############"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

echo "############ Downloading vim-plug ############"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "############ Installing python libraries ############"
sudo -H /usr/bin/pip3 install psutil
sudo -H /usr/bin/pip3 install neovim
sudo -H /usr/bin/pip3 install flake8
sudo -H /usr/bin/pip3 install autopep8
sudo -H /usr/bin/pip3 install jedi

# Check if GNU stow is installed
if ! command -v stow > /dev/null 2>&1; then
    echo "############ Installing GNU stow ############"
    sudo apt install stow
fi

# Link dotfiles
stow bash zsh tmux powerline neovim
