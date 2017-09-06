#!/bin/bash

source ~/dotfiles/scripts/vars.sh

echo -e "\n############ Update packages info ############"
${pkg_mgr_repo_update}

echo -e "\n############ Updating submodules ############"
git submodule init
git submodule update

# Install zsh
/bin/bash ~/dotfiles/scripts/install_zsh.sh

# Install tmux
/bin/bash ~/dotfiles/scripts/install_tmux.sh

# Install neovim
/bin/bash ~/dotfiles/scripts/install_neovim.sh

echo -e "\n############ Installing other essential tools ############"
${pkg_mgr_install} rclone magic-wormhole ranger mosh

echo -e "\n############ Install fzf ############"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# No folding will create necessary folders instead of linking the folder as whole
stow --no-folding ranger
