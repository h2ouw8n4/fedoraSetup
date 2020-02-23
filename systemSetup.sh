#!/bin/bash

###################################################
# Remove some un-needed stuff
sudo dnf remove -y gnome-shell-extension-background-logo
sudo dnf remove -y totem
sudo dnf remove -y cheese
sudo dnf remove -y chromium
sudo dnf remove -y flowblade
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
sudo dnf install -y arc-theme breeze-cursor-theme google-chrome-stable chrome-gnome-shell file-roller-nautilus fuse-sshfs git gnome-shell-extension-dash-to-dock gnome-shell-extension-topicons-plus gnome-shell-extension-user-theme gvfs-fuse gvfs-mtp gvfs-nfs gvfs-smb nautilus-extensions nautilus-image-converter nautilus-search-tool onedrive openssh-askpass papirus-icon-theme tilix tilix-nautilus wavemon adobe-source-code-pro-fonts iotop nano nethogs nload zsh zsh-syntax-highlighting libguestfs-tools

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
# Stage User Setup Script for Post Reboot
cat <<EOT >> /home/dbm/userSetup.sh
#!/bin/bash
sh -c \$(curl -sSL https://raw.githubusercontent.com/magicCashew/x/master/userSetup.sh)
EOT
chmod +x /home/dbm/userSetup.sh

################################################################
# Reboot system to proceed with the user setup
sudo reboot now
