#!/bin/bash

export TZ=America/Sao_Paulo

padrao="\033[0m"
verde="\033[0;32m"

command=" echo -e '"${verde}"'ON  "'$(ps -o etime= -C "Hash-Maker")'" '"${padrao}"' ; "
command=" ${command} echo "'$(date +"%d%m%Y%H%M%S") >> log.tmux'" ; "
command=" ${command} sleep 1 ; exit"

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

     pre_command=""
     pre_command="echo $conta > email"

     echo
     echo $conta
     echo "$(date)"
     gcloud beta cloud-shell ssh --boosted --command="$pre_command ; $command" --account=$conta --authorize-session --quiet
  fi

 done

done
