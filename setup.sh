#!/bin/bash
############### Configuration Options###############
#1 for Snap or 2 for Flatpak
PKGMNG=1

#1 for Bash or 2 for ZSH
Shell=1


############### Installs Packages ###############
#Runs software updates and installs apt packages
sudo sh ./Install/Packages.sh

#Runs Selected addistion software package manager
if [ $PKGMNG = 1 ]
then
	sudo sh ./Install/Snap.sh
elif  [ $PKGMNG = 2 ]
then
	sh ./Install/Flatpak.sh
else
	echo "Error installing addition packages"
	sleep 10
fi



############### Shell Configuration ###############
if [ $Shell = 1 ]
then
	sh ./Shell/Bash/BashInstall.sh
elif [ $Shell = 2 ]
then
	sh ./Shell/ZSH/ZSHInstall.sh
else
	echo "Error installing Shell Configuration"
	sleep 10
fi

############### Installs WireGuard ###############
git clone https://www.github.com/ryanvanmass/WireGuard ~/Documents/WireGuard
sh /home/$USER/Documents/WireGuard/Client/setup.sh
sudo su -c "cp ClientInformation.txt /etc/wireguard/"
sudo rm -rf ~/Documents/WireGuard

############### Configures FSTAB ###############
#Updates FSTAB and mounts Drives
sudo su -c "cat fstab.txt >> /etc/fstab"
sudo mkdir -p /media/ryan/Local/1.Olympus /media/ryan/Local/2.Hades /media/ryan/Local/3.Labyrinth /media/ryan/Remote/'1.Olympus(Remote)' /media/ryan/Remote/'2.Hades(Remote)' /media/ryan/Remote/'3.Labyrinth(Remote)'
sudo mount -a

############### Script is Finished ###############
echo "It is reccomended that you restart at this time to complete set up."
echo "Would you like to restart now? (1 for yes or 2 for no)"
read UserInput
if [ $UserInput = 1 ]
then
	sudo reboot
elif [ $UserInput = 2 ]
then
	echo "Script has Completed Successfully"
	echo "Please reboot at your earliest conviniance"
else
	echo "Error reading Input"
	echo "Script has Completed Successfully"
	echo "Please reboot at your earliest conviniance"
fi