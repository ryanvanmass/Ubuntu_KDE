#!/bin/bash

############### Systen Updates###############
sudo apt update
sudo apt upgrade -y

############### Installs Remmina Client ###############
sudo apt-add-repository -y ppa:remmina-ppa-team/remmina-next
sudo apt update
sudo apt install -y remmina remmina-plugin-rdp remmina-plugin-secret

############### Installs OBS Studio ###############
sudo apt install -y ffmpeg
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt update
sudo apt install -y obs-studio

############### Misc Packages ###############
sudo apt install -y htop iotop iftop net-tools openssh-server terminator timeshift nmap steam flameshot ttf-mscorefonts-installer tlp apt-transport-https hugo yakuake

############### Installs Vivaldi ###############
wget https://downloads.vivaldi.com/stable/vivaldi-stable_3.2.1967.41-1_amd64.deb
sudo dpkg -i vivaldi-stable_3.2.1967.41-1_amd64.deb
rm vivaldi-stable_3.2.1967.41-1_amd64.deb

############### Installs RealVNC Viewer ###############
wget https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.20.529-Linux-x64.deb
sudo dpkg -i VNC-Viewer-6.20.529-Linux-x64.deb
rm VNC-Viewer-6.20.529-Linux-x64.deb

############### Installs Onlyoffice ###############
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
sudo dpkg -i onlyoffice-desktopeditors_amd64.deb
rm onlyoffice-desktopeditors_amd64.deb

############### Installs VMWare Workstation ###############
wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-15.5.6-16341506.x86_64.bundle
sudo sh ./VMware-Workstation-Full-15.5.6-16341506.x86_64.bundle
rm VMware-Workstation-Full-15.5.6-16341506.x86_64.bundle

############### Fix any Broken Installs ###############
sudo apt --fix-broken install -y

############### Removes LibreOffice ###############
sudo apt purge -y libreoffice-core libreoffice-common
sudo apt autoremove -y