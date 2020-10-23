#!/bin/bash

data=$(date +"%d/%m/%Y %H:%M:%S")

padrao="\033[0m"
verde="\033[0;32m"
vermelho="\e[31m"

conta=$1

command=""
command=" ${command} echo -e '"${verde}"' "
command=" ${command} $data "'$(pwd)'" $conta ON "'$(ps -o etime= -C "Hash-Maker")'"  "
command=" ${command} '"${padrao}"' ;"
command=" ${command} [ ! -e 'CORE/build/Hash-Maker' ]  && echo -e '"${vermelho}"'$data $conta Hash-Maker erro!'"${padrao}"' ;"
command=" ${command} [ ! -e '.customize_environment' ] && echo -e '"${vermelho}"'$data $conta .customize_environment erro!'"${padrao}"' ;"

command=" ${command} [ ! -e 'CORE/build/Hash-Maker' ] || [ ! -e '.customize_environment' ] &&"
command=" ${command} sudo rm -rf * &&"
command=" ${command} wget -q -N https://raw.githubusercontent.com/robotpack/scripts/master/start.sh &&"
command=" ${command} chmod 777 start.sh && ./start.sh $conta &&"
command=" ${command} echo -e '"${verde}"'$data $conta Install ok!'"${padrao}"' ;"
command=" ${command} sleep 1 ; exit"

gcloud beta cloud-shell ssh --boosted --command="$command" --account=$1 --authorize-session --force-key-file-overwrite > 'logs/'$conta
sleep 1
