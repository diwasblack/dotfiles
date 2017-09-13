#!/bin/bash

# Install tmux
source ~/dotfiles/scripts/vars.sh

echo -e "\n############ Installing tmux ############"
${pkg_mgr_install} tmux

# Prompt if tmuxinator and powerline are to installed here

if ! command -v gem > /dev/null 2>&1; then
    echo -e "\n############ Installing ruby ############"
    ${pkg_mgr_install} ruby
fi

echo -e "\n############ Installing tmuxinator ############"
sudo gem install tmuxinator

# Download tmuxinator auto complete for zsh
curl --create-dirs -o ~/.config/zsh/tmuxinator.zsh https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh

# Install pip if not present
if [ ! -f /usr/bin/pip3 ]; then
    echo -e "\n############ Installing pip for python3 ############"
    ${pkg_mgr_install} python3-pip
fi

echo -e "\n############ Installing powerline ############"
sudo -H /usr/bin/pip3 install powerline-status

echo -e "\n############ Installing fontface hack ############"
# Supports powerline symbols
${pkg_mgr_install} fonts-hack-ttf

# Check if GNU stow is installed
if ! command -v stow > /dev/null 2>&1; then
    echo -e "\n############ Installing GNU stow ############"
    ${pkg_mgr_install} stow
fi

stow tmux powerline
