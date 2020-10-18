#!/bin/bash

gcloud auth list --format="value(account)" > contas.txt

lista=( `cat "contas.txt" `)

for conta in "${lista[@]}"
 do

   if echo "$conta" | grep -q "$1"; then
      gcloud auth revoke $conta
   fi

done
