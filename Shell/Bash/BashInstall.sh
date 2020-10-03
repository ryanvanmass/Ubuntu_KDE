#!/bin/bash
############### Installs Required Fonts ###############
sudo apt install -y fonts-powerline

############### "Install" Style ###############
cat Shell/Bash/bashstyle.txt >> /home/$USER/.bashrc

############### inserts alias's ###############
echo "############### ALIAS ###############" >> ~/.bashrc
echo "source ~/.aliasrc" >> ~/.bashrc

cp Shell/aliasrc /home/$USER/.aliasrc

############### Configures Terminal Emulators ###############
# Terminator
mkdir /home/$USER/.config/terminator/
cp Install/ConfigFiles/Terminal/Terminator.config /home/$USER/.config/terminator/config

#Yakuake
cp Install/ConfigFiles/Terminal/yakuakerc /home/$USER/.config