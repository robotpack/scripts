#!/bin/bash
sudo apt-get update
sudo apt-get --assume-yes install build-essential cmake libuv1-dev libssl-dev libhwloc-dev git unzip
sudo ./zerotier.sh
#sudo ./samba.sh
