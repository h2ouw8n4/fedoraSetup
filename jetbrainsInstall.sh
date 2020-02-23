################################################################
# JetBrains
sudo rm -rf /opt/phpstorm && sudo mkdir /opt/phpstorm && curl -sSL 'https://download.jetbrains.com/product?code=PS&latest&distribution=linux' | sudo tar xvz -C /opt/phpstorm --strip 1
sudo rm -rf /opt/pycharm && sudo mkdir /opt/pycharm && curl -sSL 'https://download.jetbrains.com/product?code=PC&latest&distribution=linux' | sudo tar xvz -C /opt/pycharm --strip 1
sudo rm -rf /opt/datagrip && sudo mkdir /opt/datagrip && curl -sSL 'https://download.jetbrains.com/product?code=DG&latest&distribution=linux' | sudo tar xvz -C /opt/datagrip --strip 1
sudo rm -rf /opt/webstorm && sudo mkdir /opt/webstorm && curl -sSL 'https://download.jetbrains.com/product?code=WS&latest&distribution=linux' | sudo tar xvz -C /opt/webstorm --strip 1

cat <<EOT >> /home/dbm/.local/share/applications/jetbrains-phpstorm.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=PHPStorm
Icon=/opt/phpstorm/bin/phpstorm.svg
Exec="/opt/phpstorm/bin/phpstorm.sh" %f
Comment=The smartest PHP IDE
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-phpstorm
EOT
chmod +x /home/dbm/.local/share/applications/jetbrains-phpstorm.desktop

cat <<EOT >> /home/dbm/.local/share/applications/jetbrains-pycharm.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=pyCharm
Icon=/opt/pycharm/bin/pycharm.svg
Exec="/opt/pycharm/bin/pycharm.sh" %f
Comment=The smartest Python IDE
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm
EOT
chmod +x /home/dbm/.local/share/applications/jetbrains-pycharm.desktop

cat <<EOT >> /home/dbm/.local/share/applications/jetbrains-datagrip.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=DataGrip
Icon=/opt/datagrip/bin/datagrip.svg
Exec="/opt/datagrip/bin/datagrip.sh" %f
Comment=DataGrip 
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-datagrip
EOT
chmod +x /home/dbm/.local/share/applications/jetbrains-datagrip.desktop

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
