#!/bin/bash

pularLinha='F'

if [ ! -e '.customize_environment' ]; then
   pularLinha='T'
   echo -e "$1 .customize_environment not found!"
fi

if [ ! -e 'CORE/build/Hash-Maker' ]; then
   pularLinha='T'
   echo -e "$1 Hash-Maker not found!"
fi

if [ ! -e 'CORE/build/config.json' ]; then
   pularLinha='T'
   echo -e "$1 config.json not found!"
fi

if [ pularLinha = 'T' ]; then
    echo -e "\n"
fi
