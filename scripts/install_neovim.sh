#!/bin/bash

# Detect the package manager to use
source detect_pkg_mgr.sh

echo -e "\n############ Installing neovim and xclip ############"
${pkg_mgr_install} neovim xclip

echo -e "\n############ Installing ripgrep ############"
${pkg_mgr_install} ripgrep

# Install pip if not present
if [ ! -f /usr/bin/pip3 ]; then
    echo -e "\n############ Installing pip for python3 ############"
    ${pkg_mgr_install} python3-pip
fi

echo -e "\n############ Installing python libraries ############"
sudo -H /usr/bin/pip3 install neovim
sudo -H /usr/bin/pip3 install flake8
sudo -H /usr/bin/pip3 install jedi
sudo -H /usr/bin/pip3 install yapf
sudo -H /usr/bin/pip3 install psutil
