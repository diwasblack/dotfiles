#!/bin/bash

# Declare variables to use
export pkg_mgr_install="sudo apt install -y"
export pkg_mgr_repo_update="sudo apt update"

echo -e "\n############ Update packages info ############"
${pkg_mgr_repo_update}

echo -e "\n############ Updating submodules ############"
git submodule init
git submodule update

# Install GNU stow if not installed
if ! command -v stow > /dev/null 2>&1; then
    echo -e "\n############ Installing GNU stow ############"
    ${pkg_mgr_install} stow
fi

# Install zsh
/bin/bash scripts/install_zsh.sh
stow --no-folding zsh bash

# For now do not change the default shell of current user
# chsh -s /bin/zsh

# Install tmux
/bin/bash scripts/install_tmux.sh
stow tmux powerline

# Install neovim
/bin/bash scripts/install_neovim.sh
stow --no-folding neovim

echo -e "\n############ Installing other essential tools ############"
${pkg_mgr_install} rclone magic-wormhole ranger mosh

echo -e "\n############ Install fzf ############"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# No folding will create necessary folders instead of linking the folder as whole
stow --no-folding ranger
