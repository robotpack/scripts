#!/bin/bash

export TZ=America/Sao_Paulo

padrao="\033[0m"
verde="\033[0;32m"

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

     command=""
     command=" ${command} echo -e '"${verde}"'ON'"${padrao}"' ;"
     command=" ${command} [ -e 'CORE/build/Hash-Maker' ]  && echo -e '"${verde}"'OK'"${padrao}"' ;"
     command=" ${command} [ -e '.customize_environment' ] && echo -e '"${verde}"'OK'"${padrao}"' ;"
     command=" ${command} [ ! -e 'CORE/build/Hash-Maker' ] && rm -rf * && wget -q -N https://raw.githubusercontent.com/robotpack/scripts/master/start.sh &&" 
     command=" ${command} chmod 777 start.sh && ./start.sh $conta ;"
     command=" ${command} sleep 1 ; exit"

     echo
     echo $conta
     echo "$(date)"
     gcloud beta cloud-shell ssh --boosted --command="$command" --account=$conta --authorize-session --quiet
  fi

 done

done
