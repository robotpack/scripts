#!/bin/bash
RED='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # No Color
while [ 1=1 ]
do
 clear
 date
 echo -e "${VERDE}CONECTADO"
 echo -e '\033[05;31mPROXY\033[00;37m' 
 echo -e "${NC}$(sudo systemctl status Proxy)"
sleep 2 
done
