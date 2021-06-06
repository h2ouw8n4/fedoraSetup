#!/bin/bash

###################################################
# Remove some un-needed stuff
sudo dnf remove -y gnome-shell-extension-background-logo totem cheese chromium flowblade firefox rhythmbox gnome-maps

###################################################
# Add some necessary repos
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome -y

###################################################
# Add VSCode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

###################################################
# Process Upgrade of existing packages
sudo dnf upgrade -y

###################################################
# Add Fusion Repositories
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

###################################################
# Add Flatpak Repository and add snap store
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo snap install snap-store

###################################################
# Add Desired Packages
sudo dnf install -y git nano code wget nodejs yarnpkg

###################################################
# Download Latest Zoom and Install
flatpak install flathub us.zoom.Zoom

###################################################
# Download Latest Slack and Install
flatpak install flathub com.spotify.Client

###################################################
# Download Latest 1Password and Install
wget https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm
sudo dnf install -y 1password-latest.rpm
rm 1password-latest.rpm

###################################################
# Download Latest Chrome and Install
sudo dnf install -y google-chrome-stable chrome-gnome-shell

