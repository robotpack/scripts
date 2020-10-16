#!/bin/bash

export TZ=America/Sao_Paulo
echo "$(pwd)" > home.file

wget https://raw.githubusercontent.com/robotpack/scripts/master/.customize_environment && echo $(date +"%d-%m-%Y_%H:%M:%S") >> customize_environment.log

rm -rf install.sh
wget https://raw.githubusercontent.com/robotpack/scripts/master/install.sh && chmod 777 install.sh

rm -rf cpu_usage.sh
wget https://raw.githubusercontent.com/robotpack/scripts/master/cpu_usage.sh && chmod 777 cpu_usage.sh

rm -rf zerotier.sh
wget https://raw.githubusercontent.com/robotpack/scripts/master/zerotier.sh && chmod 777 zerotier.sh

rm -rf samba.sh
wget https://raw.githubusercontent.com/robotpack/scripts/master/samba.sh && chmod 777 samba.sh

rm -rf make.sh
wget https://raw.githubusercontent.com/robotpack/scripts/master/make.sh && chmod 777 make.sh && ./make.sh
