#!/bin/bash

###################################################
# Remove some un-needed stuff
sudo dnf remove -y gnome-shell-extension-background-logo
sudo dnf remove -y totem
sudo dnf remove -y cheese
sudo dnf remove -y chromium
sudo dnf remove -y flowblade
sudo dnf remove -y gnome-boxes
sudo dnf remove -y firefox
sudo dnf remove -y rhythmbox
sudo dnf remove -y gnome-maps

###################################################
# Add some necessary repos
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome -y

sudo dnf upgrade -y

sudo dnf install -y arc-theme 
sudo dnf install -y breeze-cursor-theme 
sudo dnf install -y google-chrome-stable 
sudo dnf install -y chrome-gnome-shell 
sudo dnf install -y exfat-utils
sudo dnf install -y ffmpeg 
sudo dnf install -y file-roller-nautilus 
sudo dnf install -y fuse-exfat 
sudo dnf install -y fuse-sshfs 
sudo dnf install -y gimp 
sudo dnf install -y gimp-data-extras 
sudo dnf install -y gimp-dbp 
sudo dnf install -y gimp-dds-plugin 
sudo dnf install -y gimp-elsamuko
sudo dnf install -y gimp-focusblur-plugin 
sudo dnf install -y gimp-fourier-plugin 
sudo dnf install -y gimp-high-pass-filter 
sudo dnf install -y gimp-layer-via-copy-cut
sudo dnf install -y gimp-lensfun 
sudo dnf install -y gimp-lqr-plugin 
sudo dnf install -y gimp-luminosity-masks 
sudo dnf install -y gimp-paint-studio 
sudo dnf install -y gimp-resynthesizer 
sudo dnf install -y gimp-wavelet-decompose 
sudo dnf install -y gimp-wavelet-denoise-plugin
sudo dnf install -y git 
sudo dnf install -y gmic-gimp 
sudo dnf install -y gnome-shell-extension-dash-to-dock
sudo dnf install -y gnome-shell-extension-topicons-plus
sudo dnf install -y gnome-shell-extension-user-theme
sudo dnf install -y GREYCstoration-gimp
sudo dnf install -y gvfs-fuse
sudo dnf install -y gvfs-mtp
sudo dnf install -y gvfs-nfs
sudo dnf install -y gvfs-smb
sudo dnf install -y inkscape
sudo dnf install -y keepassxc
sudo dnf install -y nautilus-extensions
sudo dnf install -y nautilus-image-converter
sudo dnf install -y nautilus-search-tool
sudo dnf install -y openssh-askpass
sudo dnf install -y papirus-icon-theme
sudo dnf install -y tilix
sudo dnf install -y tilix-nautilus
sudo dnf install -y virt-manager
sudo dnf install -y wavemon
sudo dnf install -y adobe-source-code-pro-fonts
sudo dnf install -y iotop
sudo dnf install -y nano
sudo dnf install -y nethogs
sudo dnf install -y nload
sudo dnf install -y zsh
sudo dnf install -y zsh-syntax-highlighting
sudo dnf install -y libguestfs-tools 

################################################################
# Disable Wayland and install displaylink
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm/custom.conf
sudo sed -i '/WaylandEnable=false/ i DefaultSession=gnome-xorg.desktop' /etc/gdm/custom.conf
wget -cO /tmp/displaylink.rpm https://github.com/displaylink-rpm/displaylink-rpm/releases/download/v5.2.14-3-rc1/fedora-31-displaylink-1.6.4-2.x86_64.rpm --read-timeout=5 --tries=0
sudo dnf install -y /tmp/displaylink.rpm
rm /tmp/displaylink.rpm

################################################################
# JetBrains Toolbox
USER_AGENT=('User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36')
URL=$(curl 'https://data.services.jetbrains.com//products/releases?code=TBA&latest=true&type=release' -H 'Origin: https://www.jetbrains.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H "${USER_AGENT[@]}" -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.jetbrains.com/toolbox/download/' -H 'Connection: keep-alive' -H 'DNT: 1' --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')
sudo wget -cO  /tmp/$(basename ${URL}) ${URL} --read-timeout=5 --tries=0
sudo mkdir /opt/jetbrains-toolbox
sudo tar -xzf /tmp/$(basename ${URL}) -C /opt/jetbrains-toolbox --strip-components=1
cat <<EOT >> /tmp/jetbrains-toolbox.sh
#!/bin/bash
/opt/jetbrains-toolbox/jetbrains-toolbox
EOT
sudo mv /tmp/jetbrains-toolbox.sh /opt/jetbrains-toolbox/jetbrains-toolbox.sh
sudo chmod -R +rwx /opt/jetbrains-toolbox
sudo ln -s /opt/jetbrains-toolbox/jetbrains-toolbox.sh /usr/local/bin/jetbrains-toolbox
sudo chmod -R +rwx /usr/local/bin/jetbrains-toolbox
rm /tmp/$(basename ${URL})

cat <<EOT >> /home/dbm/installStep2.sh
#!/bin/bash
sh -c "$(curl -sSL https://github.com/magicCashew/x/blob/master/userSetup.sh)"
EOT
chmod +r /home/dbm/installStep2.sh

#The user needs to reboot to apply all changes.
sudo reboot now
