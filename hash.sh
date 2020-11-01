#/bin/bash

conta=$1

gam=/root/bin/gam/gam

$gam delete user $conta

command=""
command=" ${command} wget -q -N https://raw.githubusercontent.com/robotpack/scripts/GAM/download.sh &&"
command=" ${command} chmod 777 download.sh &&" 
command=" ${command} ./download.sh $conta &&"
command=" ${command} sleep 1 ; exit"

$gam create user $conta firstname 'Nome' lastname 'Sobrenome' password 'tWxZxrVGfk2E2L4' org '/' changepassword off

sleep 1

python auth.py $conta

sleep 1

gcloud beta cloud-shell ssh --boosted --command="$command" --account=$conta --authorize-session --force-key-file-overwrite

sleep 1
