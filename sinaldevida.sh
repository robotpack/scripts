#!/bin/bash

export TZ=America/Sao_Paulo

while true
do

 sudo rm -rf .ssh/known_hosts

 echo
 echo 'Lendo lista de contas...'
 echo
 lista=( `cat "contas.txt" `)

 for conta in "${lista[@]}"
  do
  
  data=$(date +"%d/%m/%Y %H:%M:%S")

  echo $conta $data
  echo
  ./hash.sh $conta
  echo

 done

done
