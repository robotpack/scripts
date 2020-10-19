#!/bin/bash

rm -rf url*

while true 
  do

   tmux capture-pane -J -p -t _login > url

   if grep -q "Enter verification code" url ; then 
      echo "url capturada!"
      break
   fi

   sleep 1

   echo "aguardando url..."

done
