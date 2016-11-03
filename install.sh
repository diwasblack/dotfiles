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
sudo apt-get update

echo "############ Installing tmux and zsh ############"
sudo apt-get install tmux zsh

if ! command -v gem > /dev/null 2>&1; then
    echo "############ Installing ruby ############"
    sudo apt-get install ruby
fi

echo "############ Installing tmuxinator ############"
sudo gem install tmuxinator

# Install pip if not present
if [ ! -f /usr/bin/pip3 ]; then
    echo "############ Installing pip for python3 ############"
    sudo apt-get install python3-pip
fi

echo "############ Installing powerline ############"
sudo -H /usr/bin/pip3 install powerline-status

if ! command -v curl > /dev/null 2>&1; then
    echo "############ Installing curl ############"
    sudo apt-get install curl
fi

echo "############ Installing fontface hack ############"
sudo apt-get install fonts-hack-ttf

# echo "############ Setting up powerline fonts ############"
# curl -fLo ~/.fonts/PowerlineSymbols.otf --create-dirs \
#     https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf

# if ! command -v fc-cache > /dev/null 2>&1; then
#     echo "############ Installing fontconfig ############"
#     sudo apt-get install fontconfig
# fi

# curl -fLo ~/.config/fontconfig/conf.d/10-powerline-symbols.conf  --create-dirs \
#     https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

# fc-cache -vf ~/.fonts/

# Create directory for keeping old files
if [ ! -d $HOME/oldfiles ]; then
    mkdir $HOME/oldfiles
fi

# Backup oldfiles
names=( "tmux.conf" "zshrc" "bash_aliases")
files=( ".tmux.conf" ".zshrc" ".bash_aliases")
for i in `seq 0 2`; do
    if [ -f $HOME/${files[$i]} ]; then
        mv "$HOME/${files[$i]}" "$HOME/oldfiles/"
    fi
    ln -s $HOME/dotfiles/${names[$i]} $HOME/${files[$i]}
done
ln -s $HOME/dotfiles/powerline $HOME/.config/powerline

echo "############ Setting up neovim ############"
echo "############ Downloading vim-plug ############"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "############ Installing python libraries ############"
sudo -H /usr/bin/pip3 install psutil
sudo -H /usr/bin/pip3 install neovim
sudo -H /usr/bin/pip3 install flake8
sudo -H /usr/bin/pip3 install autopep8
sudo -H /usr/bin/pip3 install jedi

ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
