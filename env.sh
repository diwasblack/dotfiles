#!/bin/bash

echo "Installing tmux and zsh"
sudo apt-get install tmux zsh

if ! command -v gem > /dev/null 2>&1; then
    echo "Installing ruby"
    sudo apt-get install ruby
fi

echo "Installing tmuxinator"
sudo gem install tmuxinator

echo "Installing powerline"
sudo -H /usr/local/bin/pip3 install powerline-status

echo "Setting up powerline"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

if ! command -v fc-cache > /dev/null 2>&1; then
    echo "Installing fontconfig"
    sudo apt-get install fontconfig
fi

mv PowerlineSymbols.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.fonts/

echo "Creating necessary dotfiles"
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
