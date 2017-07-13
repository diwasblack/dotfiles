#!/bin/bash

# Check if script is running as sudo
if [ "$EUID" -eq 0 ]
  then echo "Run script without sudo"
  exit
fi

echo -e "\n############ Update packages info ############"
sudo apt update

echo -e "\n############ Installing packages ############"
sudo apt install zsh tmux ranger mosh vim silversearcher-ag

# Install antibody for zsh
# Check if curl is installed
if ! command -v curl > /dev/null 2>&1; then
    echo -e "\n############ Installing curl ############"
    sudo apt install curl
fi

echo -e "\n############ Install antibody for zsh ############"
curl -sL https://git.io/antibody | bash -s

# Check if GNU stow is installed
if ! command -v stow > /dev/null 2>&1; then
    echo -e "\n############ Installing GNU stow ############"
    sudo apt install stow
fi

# Link dotfiles
stow bash zsh ranger vim
