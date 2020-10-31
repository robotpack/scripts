#/bin/bash

gam=/root/bin/gam/gam

echo $1

while true
   do

$gam create user $1 firstname 'Nome' lastname 'Sobrenome' password 'tWxZxrVGfk2E2L4' org '/' changepassword off

sleep 10

python auth.py $1

sleep 1

gcloud beta cloud-shell ssh --boosted --account=$1 --authorize-session --force-key-file-overwrite

sleep 1

echo 'ok'

$gam delete user $1

gcloud auth revoke $1

sleep 10

done
