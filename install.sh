#!/bin/bash

set -e

#Install essential packages
echo "Installing essential packages..."
sudo pacman -S hypridle hyprlock wofi waybar hyprpaper otf-font-awesome ttf-roboto-mono swaync brightnessctl
echo "Done!"

#Make directories
CONFIG="$HOME/.config"
echo "Making needed directories"
echo "Make directory .config/hypr"
sudo mkdir -p "$CONFIG/hypr"
echo "Make directory .config/waybar"
sudo mkdir -p "$CONFIG/waybar"
echo "Make directory .config/wofi"
sudo mkdir -p "$CONFIG/wofi"
echo "Done!"
#Copy files
echo "Copying config files..."
echo "Copy hypr folder to .config"
sudo cp -r ./hypr/* "$CONFIG/hypr/"
echo "Copy waybar folder to .config"
sudo cp -r ./waybar/* "$CONFIG/waybar"
echo "Copy wofi folder to .config"
sudo cp -r ./wofi/* "$CONFIG/wofi"
echo "Copy electron-flags configuration to .config"
sudo cp -r ./electron-flags.conf "$CONFIG"
sudo echo "Done!"

read -p "Do you want to reboot now to apply changes? [y/n]" answer
if [ $answer = "y" ]; then
	echo "Rebooting now..."
	systemctl reboot
else
	echo "Reboot cancelled."
fi


