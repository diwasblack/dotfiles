#!/bin/bash

# Detects the package manager to use
# For now detects: apt, pacman

if command -v apt > /dev/null 2>&1; then
    echo -e "\n############ USING APT AS PACKAGE MANAGER ############"
    export pkg_mgr_install="sudo apt install -y"
    export pkg_mgr_repo_update="sudo apt update"
fi

if command -v pacman > /dev/null 2>&1; then
    echo -e "\n############ USING PACMAN AS PACKAGE MANAGER ############"
    export pkg_mgr_install="sudo pacman -S --force"
    export pkg_mgr_repo_update="sudo pacman -Syy"
fi
