#!/bin/bash

# -----------------------------------------------------------------------------------------------------------------
# This Script Install packages base on Linux distributions
# Packages: python3-pip, py3-pip codespell
# Author: Ori Nahum
# Collaborator : Avishay Layani
# https://linuxcommandlibrary.com/man/codespell
# https://rhel.pkgs.org/9/epel-x86_64/codespell-2.2.1-1.el9.noarch.rpm.html
# -----------------------------------------------------------------------------------------------------------------

codespell --version > /dev/null
#check if codespell is install
if [[ $? != 0 ]];
then
     # checking if the OS is Debian, Rocky or Alpine and running installations accordingly
    . /etc/os-release

    if [[ $ID = "debian" || $ID = 'ubuntu' ]]; then
        sudo apt-get update -y
        sudo apt-get install -y apt-utils codespell
        echo "[+] codespell installed on Debian"

    elif [[ $ID = "rocky" ]]; then
        sudo dnf update -y
        sudo dnf install -y  python3-pip
        pip3 install codespell
        echo "[+] codespell installed on Rocky"

    elif [[ $ID = "alpine" ]]; then 
        sudo apk --no-cache --update add py3-pip
        pip3 install codespell
        echo "[+] codespell installed on Alpine"

    else
        printf "[!] Your OS %s is not compatible with this pipeline. \n[!] This is meant for Debian, Rocky or Alpine systems ONLY\n" $ID
        exit 1
    fi
else
    echo "[+] codespell already installed"
fi



