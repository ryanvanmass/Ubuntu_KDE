#/bin/bash

sudo su -c " echo ' ' >> /etc/fstab"
sudo su -c " echo ' ' >> /etc/fstab"
sudo su -c " echo '#Local' >> /etc/fstab"
sudo su -c " echo '//192.168.1.3/Olympus	/media/$USER/Local/Olympus	cifs	username=,password=,noperm	0	0' >> /etc/fstab"
sudo su -c " echo '//192.168.1.3/Hades	/media/$USER/Local/Hades	cifs	username=,password=,noperm	0	0' >> /etc/fstab"
sudo su -c " echo '//192.168.1.3/Labyrinth	/media/$USER/Local/Labyrinth	cifs	username=,password=,noperm	0	0' >> /etc/fstab"

