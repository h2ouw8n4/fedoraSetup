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
sudo dnf remove -y gnome-terminal

###################################################
# Add some necessary repos
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome -y

###################################################
# Process Upgrade of existing packages
sudo dnf upgrade -y

###################################################
# Add Desired Packages
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
sudo dnf install -y wavemon
sudo dnf install -y adobe-source-code-pro-fonts
sudo dnf install -y iotop
sudo dnf install -y nano
sudo dnf install -y nethogs
sudo dnf install -y nload
sudo dnf install -y zsh
sudo dnf install -y zsh-syntax-highlighting
sudo dnf install -y libguestfs-tools 

####################################################
# Install VMWare
wget -cO /tmp/getworkstation-linux.sh https://www.dropbox.com/s/jrthoy9s90dxr96/VMware-Workstation-Full-15.5.1-15018445.x86_64.bundle?dl=0
chmod +x /tmp/getworkstation-linux.sh
sudo /tmp/getworkstation-linux.sh
rm /tmp/getworkstation-linux.sh

####################################################
# Install Oracle Instant Client
wget -cO /tmp/oracle-instantclient11.2-basic.rpm https://www.dropbox.com/s/ufpemzxazrpaprr/oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm?dl=0 --read-timeout=5 --tries=0
sudo dnf install -y /tmp/oracle-instantclient11.2-basic.rpm
rm /tmp/oracle-instantclient11.2-basic.rpm

wget -cO /tmp/oracle-instantclient11.2-dev.rpm https://www.dropbox.com/s/82kert11uddeone/oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm?dl=0 --read-timeout=5 --tries=0
sudo dnf install -y /tmp/oracle-instantclient11.2-dev.rpm
rm /tmp/oracle-instantclient11.2-dev.rpm

wget -cO /tmp/oracle-instantclient11.2-jdbc.rpm https://www.dropbox.com/s/mnjwv5rhi18atq5/oracle-instantclient11.2-jdbc-11.2.0.4.0-1.x86_64.rpm?dl=0 --read-timeout=5 --tries=0
sudo dnf install -y /tmp/oracle-instantclient11.2-jdbc.rpm
rm /tmp/oracle-instantclient11.2-jdbc.rpm

wget -cO /tmp/oracle-instantclient11.2-odbc.rpm https://www.dropbox.com/s/kacxgu2641v9imh/oracle-instantclient11.2-odbc-11.2.0.4.0-1.x86_64.rpm?dl=0 --read-timeout=5 --tries=0
sudo dnf install -y /tmp/oracle-instantclient11.2-odbc.rpm
rm /tmp/oracle-instantclient11.2-odbc.rpm

wget -cO /tmp/oracle-instantclient11.2-sqlplus.rpm https://www.dropbox.com/s/cpriv7h7tyd1ovz/oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm?dl=0 --read-timeout=5 --tries=0
sudo dnf install -y /tmp/oracle-instantclient11.2-sqlplus.rpm
rm /tmp/oracle-instantclient11.2-sqlplus.rpm

wget -cO /tmp/oracle-instantclient11.2-tools.rpm https://www.dropbox.com/s/5zotpejjo3u4dur/oracle-instantclient11.2-tools-11.2.0.4.0-1.x86_64.rpm?dl=0 --read-timeout=5 --tries=0
sudo dnf install -y /tmp/oracle-instantclient11.2-tools.rpm
rm /tmp/oracle-instantclient11.2-tools.rpm

cd /usr/lib/oracle/11.2/client64/bin
sudo ln -s libclntsh.so.11.1 libclntsh.so
sudo ln -s libocci.so.11.1 libocci.so
sudo sh -c "echo /usr/lib/oracle/11.2/client64/bin > /etc/ld.so.conf.d/oracle-instantclient.conf"
sudo ldconfig

################################################################
# Disable Wayland and Install Displaylink
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm/custom.conf
sudo sed -i '/WaylandEnable=false/ i DefaultSession=gnome-xorg.desktop' /etc/gdm/custom.conf
wget -cO /tmp/displaylink.rpm https://github.com/displaylink-rpm/displaylink-rpm/releases/download/v5.2.14-3-rc1/fedora-31-displaylink-1.6.4-2.x86_64.rpm --read-timeout=5 --tries=0
sudo dnf install -y /tmp/displaylink.rpm
rm /tmp/displaylink.rpm

################################################################
# JetBrains
wget 'https://download.jetbrains.com/product?code=PS&latest&distribution=linux' | sudo tar xvz -C /opt/phpstorm --strip 1
wget 'https://download.jetbrains.com/product?code=PC&latest&distribution=linux' | sudo tar xvz -C /opt/pycharm --strip 1
wget 'https://download.jetbrains.com/product?code=DG&latest&distribution=linux' | sudo tar xvz -C /opt/datagrip --strip 1
wget 'https://download.jetbrains.com/product?code=WS&latest&distribution=linux' | sudo tar xvz -C /opt/webstorm --strip 1

cat <<EOT >> /home/dbm/.local/share/applications/jetbrains-webstorm.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=WebStorm
Icon=/opt/webstorm/bin/webstorm.svg
Exec="/opt/webstorm/bin/webstorm.sh" %f
Comment=The smartest JavaScript IDE
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-webstorm
EOT
chmod +x /home/dbm/.local/share/applications/jetbrains-webstorm.desktop


################################################################
# Stage User Setup Script for Post Reboot
cat <<EOT >> /home/dbm/userSetup.sh
#!/bin/bash
sh -c \$(curl -sSL https://github.com/magicCashew/x/blob/master/userSetup.sh)
EOT
chmod +x /home/dbm/userSetup.sh

################################################################
# Reboot system to proceed with the user setup
sudo reboot now
