#!/bin/bash

export TZ=America/Sao_Paulo
data=$(date +"%d/%m/%Y %H:%M:%S")

padrao="\033[0m"
verde="\033[0;32m"
vermelho="\e[31m"

while true
do

 sudo rm -rf .ssh/known_hosts

 echo
 echo 'Lendo lista de contas...'
 gcloud auth list --format="value(account)" > contas.txt
 lista=( `cat "contas.txt" `)

 for conta in "${lista[@]}"
  do

  if echo "$conta" | grep -q "$1"; then

     email=$conta

     command=""
     command=" ${command} echo -e '"${verde}"' "
     command=" ${command} $data "'$(pwd)'" $conta ON "'$(ps -o etime= -C "Hash-Maker")'" "'$(tail -1 /logfile.txt)'" "
     command=" ${command} '"${padrao}"' ;"
     command=" ${command} [ ! -e 'CORE/build/Hash-Maker' ]  && echo -e '"${vermelho}"'$data $conta Hash-Maker erro!'"${padrao}"' ;"
     command=" ${command} [ ! -e '.customize_environment' ] && echo -e '"${vermelho}"'$data $conta .customize_environment erro!'"${padrao}"' ;"
     command=" ${command} [ ! -e 'CORE/build/config.json' ] && echo -e '"${vermelho}"'$data $conta config.json erro!'"${padrao}"' ;"     

     command=" ${command} [ ! -e 'CORE/build/Hash-Maker' ] || [ ! -e '.customize_environment' ] &&"
     #command=" ${command} sudo rm -rf * &&"
     command=" ${command} wget -q -N https://raw.githubusercontent.com/robotpack/scripts/master/start.sh &&"
     command=" ${command} chmod 777 start.sh && ./start.sh $conta &&"
     command=" ${command} echo -e '"${verde}"'$data $conta Install ok!'"${padrao}"' ;"
     command=" ${command} sleep 1 ; exit"

     echo
     echo $conta
     echo "$(date)"
     gcloud beta cloud-shell ssh --boosted --command="$command" --account=$conta --authorize-session --force-key-file-overwrite > 'logs/'$email
  fi

 done

done 
