#!/bin/bash
flatpak install -y app/org.kde.kdenlive/x86_64/stable 
flatpak install -y app/org.gimp.GIMP/x86_64/stable
flatpak install -y com.spotify.Client

#included in here due to code only being availible through snap on ubuntu
sudo apt install code -y