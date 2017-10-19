#!/bin/bash

# Declare variables to use
export pkg_mgr_install="sudo apt install -y"

echo -e "\n############ Installing zsh ############"
${pkg_mgr_install} zsh

# Check if curl is installed
if ! command -v curl > /dev/null 2>&1; then
    echo -e "\n############ Installing curl ############"
    ${pkg_mgr_install} curl
fi

echo -e "\n############ Install antibody for zsh ############"
curl -sL https://git.io/antibody | bash -s

# Check if GNU stow is installed
if ! command -v stow > /dev/null 2>&1; then
    echo -e "\n############ Installing GNU stow ############"
    ${pkg_mgr_install} stow
fi

# No folding will create necessary folders instead of linking the folder as whole
stow --no-folding zsh bash

# For now do not change the default shell of current user
# chsh -s /bin/zsh
