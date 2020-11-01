#!/bin/bash

export TZ=America/Sao_Paulo

while true
do

 sudo rm -rf .ssh/known_hosts

 echo
 echo 'Lendo lista de contas...'
 lista=( `cat "contas.txt" `)

 for conta in "${lista[@]}"
  do
  
  echo $conta
  ./hash.sh $conta
  echo

 done

done
