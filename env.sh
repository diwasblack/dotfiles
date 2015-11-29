#!/bin/bash

echo "Installing tmux and zsh"
sudo apt-get install tmux zsh
echo "Installing tmuxinator"
gem install tmuxinator

# Create directory for keeping old files
if [ ! -d $HOME/oldfiles ]; then
    mkdir $HOME/oldfiles
fi

# Move previous files to another directory
names=( "tmux.conf" "zshrc" )
files=( ".tmux.conf" ".zshrc" )
for i in `seq 0 1`; do
    if [ -f $HOME/${files[$i]} ]; then
        mv "$HOME/${files[$i]}" "$HOME/oldfiles/"
    fi
    ln -s $HOME/dotfiles/${names[$i]} $HOME/${files[$i]}
done
