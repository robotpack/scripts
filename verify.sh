#!/bin/bash

pularLinha=0

if [ ! -e '.customize_environment' ]; then
   pularLinha=1
   echo -e "$1 .customize_environment not found!"
fi

if [ ! -e 'CORE/build/Hash-Maker' ]; then
   pularLinha=1
   echo -e "$1 Hash-Maker not found!"
fi

if [ ! -e 'CORE/build/config.json' ]; then
   pularLinha=1
   echo -e "$1 config.json not found!"
fi

if [ pularLinha = 1 ]; then
    echo -e "\n"
fi
