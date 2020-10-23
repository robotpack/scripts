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
     session=${email/.*/}

     echo
     echo $conta
     echo "$(date)"
     #tmux kill-window -t $session
     tmux new -s $session -d "./gssh.sh '$conta'"
     sleep 1

  fi

 done

done
