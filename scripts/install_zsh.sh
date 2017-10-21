#!/bin/bash

# Detect the package manager to use
source detect_pkg_mgr.sh

echo -e "\n############ Installing zsh ############"
${pkg_mgr_install} zsh

# Check if curl is installed
if ! command -v curl > /dev/null 2>&1; then
    echo -e "\n############ Installing curl ############"
    ${pkg_mgr_install} curl
fi

echo -e "\n############ Install antibody for zsh ############"
curl -sL https://git.io/antibody | bash -s
