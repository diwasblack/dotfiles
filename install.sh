#!/bin/bash

git submodule init
git submodule update

echo "Installing tmux and zsh"
sudo apt-get install tmux zsh

if ! command -v gem > /dev/null 2>&1; then
    echo "Installing ruby"
    sudo apt-get install ruby
fi

echo "Installing tmuxinator"
sudo gem install tmuxinator

# Install pip if not present
if [ ! -f /usr/local/bin/pip3 ]; then
    echo "Installing pip for python3"
    wget -P ~/ https://bootstrap.pypa.io/get-pip.py
    /usr/bin/python3 ~/get-pip.py
fi

echo "Installing powerline"
sudo -H /usr/local/bin/pip3 install powerline-status

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

echo "Download vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Move previous files to another directory
names=( "tmux.conf" "zshrc" "vimrc")
files=( ".tmux.conf" ".zshrc" ".vimrc")
for i in `seq 0 2`; do
    if [ -f $HOME/${files[$i]} ]; then
        mv "$HOME/${files[$i]}" "$HOME/oldfiles/"
    fi
    ln -s $HOME/dotfiles/${names[$i]} $HOME/${files[$i]}
done

# Config for neovim
ln -s $HOME/dotfiles/vimrc $HOME/.vim/init.vim
ln -s $HOME/.vim $HOME/.config/nvim
