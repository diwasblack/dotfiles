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
sudo apt install -y tmux zsh

# Check if curl is installed
if ! command -v curl > /dev/null 2>&1; then
    echo -e "\n############ Installing curl ############"
    sudo apt install -y curl
fi

echo -e "\n############ Install antibody for zsh ############"
curl -sL https://git.io/antibody | bash -s

if ! command -v gem > /dev/null 2>&1; then
    echo -e "\n############ Installing ruby ############"
    sudo apt install -y ruby
fi

echo -e "\n############ Installing tmuxinator ############"
sudo gem install tmuxinator

# Install pip if not present
if [ ! -f /usr/bin/pip3 ]; then
    echo -e "\n############ Installing pip for python3 ############"
    sudo apt install -y python3-pip
fi

echo -e "\n############ Installing powerline ############"
sudo -H /usr/bin/pip3 install powerline-status

echo -e "\n############ Installing fontface hack ############"
# Supports powerline symbols
sudo apt install -y fonts-hack-ttf

echo -e "\n############ Installing neovim and xclip ############"
sudo apt install -y neovim xclip

echo -e "\n############ Installing silver searcher ############"
sudo apt install -y silversearcher-ag

echo -e "\n############ Installing other essential tools ############"
sudo apt install -y rclone magic-wormhole ranger mosh

echo -e "\n############ Install fzf ############"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo -e "\n############ Installing python libraries ############"
sudo -H /usr/bin/pip3 install neovim
sudo -H /usr/bin/pip3 install flake8
sudo -H /usr/bin/pip3 install jedi
sudo -H /usr/bin/pip3 install yapf
sudo -H /usr/bin/pip3 install psutil

# Check if GNU stow is installed
if ! command -v stow > /dev/null 2>&1; then
    echo -e "\n############ Installing GNU stow ############"
    sudo apt install -y stow
fi

# Link dotfiles
stow bash zsh tmux powerline neovim ranger
