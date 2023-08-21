#!/bin/bash
# Date: 2023/08/21 09:39AM
# Author: Stefan de Beer
# Title: Update & Upgrade System using Nala
# Description: This script will use Nala to update a Ubuntu system. I use this as part of my dailies to ensure that my system is up to date.
# Prerequisites: Nala must be installed. You can see how to install it here: https://adamtheautomator.com/nala-apt/
# eMail: stefandebeer85@gmail.com

GREEN="\033[0;32m" # Green
NC="\033[0m" # No Color

# Check if Nala is already installed, if not then install Nala.
if ! command -v nala &> /dev/null; then
    echo "Nala is not installed. Installing Nala..."
    sudo apt update
    sudo apt install nala
else
    echo "Nala is already installed."
fi

printf "\n\n"
printf "Starting ${GREEN}APT Update${NC}!\n"
printf "\n\n"
sudo nala update 
printf "\n\n"
printf "Starting ${GREEN}APT Full-Upgrade${NC}!\n"
printf "\n\n"
sudo nala upgrade
printf "\n\n"
read -t 5 -p "Pausing for 5-seconds before continuing the Autoremove & Autoclean!"
printf "\n\n"
sudo apt autoremove -y && sudo apt autoclean -yy
printf "\n\n"
printf "Successfully ${GREEN}Updated & Upgraded ${NC}System!\n"
printf "\n\n"
exit  1
# End of script
