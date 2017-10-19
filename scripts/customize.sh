#!/bin/bash

# Customization script for ubuntu

# Declare variables to use
export pkg_mgr_install="sudo apt install -y"

echo -e "\n############ Installing unity-tweak-tool ############"
${pkg_mgr_install} unity-tweak-tool

echo -e "\n############ Installing arc-theme ############"
${pkg_mgr_install} arc-theme
