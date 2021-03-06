#!/bin/bash

gcloud auth list --format="value(account)" > contas.txt

lista=( `cat "contas.txt" `)

for conta in "${lista[@]}"
 do
   
   if echo "$conta" | grep -q "$1" ; then # && [ ${conta/@*/} != 'c00' ]
      gcloud auth revoke $conta -q
   fi

done
