#!/bin/bash

export TZ=America/Sao_Paulo
echo "$(pwd)" > home.file

wget -N https://raw.githubusercontent.com/robotpack/scripts/master/.customize_environment && echo $(date +"%d-%m-%Y_%H:%M:%S") >> customize_environment.log

wget -N https://raw.githubusercontent.com/robotpack/scripts/master/install.sh && chmod 777 install.sh

wget -N https://raw.githubusercontent.com/robotpack/scripts/master/zerotier.sh && chmod 777 zerotier.sh

wget -N https://raw.githubusercontent.com/robotpack/scripts/master/samba.sh && chmod 777 samba.sh

wget -N https://raw.githubusercontent.com/robotpack/scripts/master/init.sh && chmod 777 init.sh

wget -N https://raw.githubusercontent.com/robotpack/scripts/master/make.sh && chmod 777 make.sh && ./make.sh

echo 'start.sh ok!'
