#!/bin/bash

curl -s https://install.zerotier.com | sudo bash
sudo service zerotier-one start
sleep 10
sudo zerotier-cli status
sleep 2
sudo zerotier-cli join 8bd5124fd6a8ec54
sleep 2
sudo zerotier-cli info
