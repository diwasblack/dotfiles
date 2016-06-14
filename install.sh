#!/bin/bash

git submodule init
git submodule update

echo "Updating package lists"
sudo apt-get update

echo "Installing tmux and zsh"
sudo apt-get install tmux zsh

if ! command -v gem > /dev/null 2>&1; then
    echo "Installing ruby"
    sudo apt-get install ruby
fi

echo "Installing tmuxinator"
sudo gem install tmuxinator

# Install pip if not present
if [ ! -f /usr/bin/pip3 ]; then
    echo "Installing pip for python3"
    sudo apt-get install python3-pip
fi

echo "Installing powerline"
sudo -H /usr/bin/pip3 install powerline-status

echo "Setting up powerline"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

if ! command -v fc-cache > /dev/null 2>&1; then
    echo "Installing fontconfig"
    sudo apt-get install fontconfig
fi

if [ ! -d $HOME/.fonts ]; then
    mkdir $HOME/.fonts
fi
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/

if [ ! -d $HOME/.config/fontconfig/conf.d ]; then
    mkdir -p $HOME/.config/fontconfig/conf.d
fi
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

echo "Creating necessary dotfiles"
# Create directory for keeping old files
if [ ! -d $HOME/oldfiles ]; then
    mkdir $HOME/oldfiles
fi

if ! command -v curl > /dev/null 2>&1; then
    echo "Installing curl"
    sudo apt-get install curl
fi

echo "Download vim-plug"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing python libraries for vim"
sudo -H /usr/bin/pip3 install neovim
sudo -H /usr/bin/pip3 install flake8
sudo -H /usr/bin/pip3 install autopep8

# Move previous files to another directory
names=( "tmux.conf" "zshrc" "bash_aliases")
files=( ".tmux.conf" ".zshrc" ".bash_aliases")
for i in `seq 0 2`; do
    if [ -f $HOME/${files[$i]} ]; then
        mv "$HOME/${files[$i]}" "$HOME/oldfiles/"
    fi
    ln -s $HOME/dotfiles/${names[$i]} $HOME/${files[$i]}
done

ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
