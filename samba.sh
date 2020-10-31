#!/bin/bash

sudo apt --assume-yes install samba
chmod 777 /root
wget -N https://raw.githubusercontent.com/robotpack/scripts/master/config.samba && chmod 777 config.samba
sudo ./config.samba >> /etc/samba/smb.conf
#sudo /etc/init.d/samba-ad-dc restart
sudo service smbd restart
