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

############### Configure X11VNC ###############
#Installs and sets the VNC Password
sudo apt install -y x11vnc
x11vnc -storepasswd

#Sets VNC server to start at boot
crontab -l | { cat; echo "@reboot x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/ryan/.vnc/passwd -rfbport 5900 -shared"; } | crontab -

############### Installs WireGuard ###############
git clone https://www.github.com/ryanvanmass/WireGuard ~/Documents/WireGuard

############### Configure KWin Window Rules ###############
cp Install/ConfigFiles/WindowRules/kwinrulesrc /home/$USER/.config/

############### Configure Global Keyboard Shortcuts ###############
rm /home/$USER/.config/kglobalshortcutsrc
cp Install/ConfigFiles/KeyboardShortcuts/kglobalshortcutsrc /home/$USER/.config/

############### Configure Global Theme ###############
lookandfeeltool -a 'org.kde.breezedark.desktop'

############### Configures FSTAB ###############
#Updates FSTAB and mounts Drives
sh fstab.sh
sudo mkdir -p /media/$USER/Local/Olympus /media/$USER/Local/Hades /media/$USER/Local/Labyrinth

############### Set Desktop Wallpaper ###############
#Copy Wallpaper to user pichure Directory
cp Install/ConfigFiles/Desktop.png /home/$USER/Pictures

# This is the command to change the desktop background on KDE plasma

qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
    var allDesktops = desktops();
    for (i=0;i<allDesktops.length;i++) 
    {
        d = allDesktops[i];
        d.wallpaperPlugin = 'org.kde.image';
        d.currentConfigGroup = Array('Wallpaper', 'org.kde.image', 'General');
        d.writeConfig('Image', 'file:///home/$USER/Pictures/Desktop.png')
    }
"
############### Set Default Apps ###############
cp Install/ConfigFiles/DefaultApps/mimeapps.list /home/$USER/.config/

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