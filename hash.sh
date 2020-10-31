#/bin/bash

conta=$1

gam=/root/bin/gam/gam

gcloud auth revoke $1 --quiet

$gam delete user $1

command=""
command=" ${command} echo $conta > email &&"
command=" ${command} wget -q -N https://raw.githubusercontent.com/robotpack/scripts/master/start.sh &&"
command=" ${command} chmod 777 start.sh &&" 
command=" ${command} ./start.sh $conta &&"
command=" ${command} sleep 1 ; exit"

$gam create user $1 firstname 'Nome' lastname 'Sobrenome' password 'tWxZxrVGfk2E2L4' org '/' changepassword off

sleep 1

python auth.py $1

sleep 1

gcloud beta cloud-shell ssh --boosted --command="$command" --account=$1 --authorize-session --force-key-file-overwrite

sleep 1
