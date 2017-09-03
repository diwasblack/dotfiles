#!/bin/bash

# Customization script for ubuntu

source ~/dotfiles/scripts/vars.sh

echo -e "\n############ Installing unity-tweak-tool ############"
${pkg_mgr_install} unity-tweak-tool

echo -e "\n############ Installing arc-theme ############"
${pkg_mgr_install} arc-theme

echo -e "\n############ Installing redshift ############"
${pkg_mgr_install} redshift redshift-gtk
