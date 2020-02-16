#!/bin/bash

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

###################################################
# Remove some un-needed stuff
sudo dnf remove -y gnome-shell-extension-background-logo
sudo dnf remove -y totem
sudo dnf remove -y cheese
sudo dnf remove -y chromium
sudo dnf remove -y flowblade
sudo dnf remove -y gnome-boxes
sudo dnf remove -y firefox

sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm/custom.conf
sudo sed -i '/WaylandEnable=false/ i DefaultSession=gnome-xorg.desktop' /etc/gdm/custom.conf

###################################################
# Theming and GNOME Options

# Tilix Dark Theme
gsettings set com.gexperts.Tilix.Settings theme-variant 'dark'

#Gnome Shell Theming
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Breeze_Snow'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.shell.extensions.user-theme name 'Arc-Dark-solid'

#Set SCP as Monospace (Code) Font
gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro Semi-Bold 12'

#Set Extensions for gnome
gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com', 'TopIcons@phocean.net', 'dash-to-dock@micxgx.gmail.com']"

#Better Font Smoothing
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'

#Usability Improvements
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'adaptive'
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent false
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false

#Dash to Dock Theme
gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots true
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#729fcf'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock force-straight-corner false
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode 'ALL_WINDOWS'
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'SEGMENTED'
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.70000000000000000
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'

#Nautilus (File Manager) Usability
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'standard'
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gnome.nautilus.list-view use-tree-view true

gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/gnome/adwaita-timed.xml'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/gnome/adwaita-timed.xml'

################################################################
# JetBrains Toolbox
function getLatestUrl() {
USER_AGENT=('User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36')
URL=$(curl 'https://data.services.jetbrains.com//products/releases?code=TBA&latest=true&type=release' -H 'Origin: https://www.jetbrains.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H "${USER_AGENT[@]}" -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.jetbrains.com/toolbox/download/' -H 'Connection: keep-alive' -H 'DNT: 1' --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')
echo $URL
}
getLatestUrl
FILE=$(basename ${URL})
DEST=/home/dbm/Downloads/$FILE
wget -cO  ${DEST} ${URL} --read-timeout=5 --tries=0
DIR="/opt/jetbrains-toolbox"
if sudo mkdir ${DIR}; then
    sudo tar -xzf ${DEST} -C ${DIR} --strip-components=1
fi
sudo chmod -R +rwx ${DIR}
sudo touch ${DIR}/jetbrains-toolbox.sh
sudo echo '#!/bin/bash' >> $DIR/jetbrains-toolbox.sh
sudo echo "$DIR/jetbrains-toolbox" >> $DIR/jetbrains-toolbox.sh

sudo ln -s ${DIR}/jetbrains-toolbox.sh /usr/local/bin/jetbrains-toolbox
sudo chmod -R +rwx /usr/local/bin/jetbrains-toolbox
rm ${DEST}

####################################################
# nvm Node Install
sh -c "$(curl -sSL https://raw.githubusercontent.com/creationix/nvm/master/install.sh)"
source /home/dbm/.bashrc
nvm install --lts --latest-npm

# Install global npm requirements
npm install --unsafe-perm -g gulp grunt grunt-cli uglify-js yarn

mkdir /home/dbm/Applications
curl https://www.navicat.com/download/direct-download?product=navicat15-premium-en.AppImage&location=1 --output /home/dbm/Applications/navicat15-premium-en.AppImage
chmod +x navicat15-premium-en.AppImage

#The user needs to reboot to apply all changes.
sudo reboot now
