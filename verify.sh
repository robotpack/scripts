#!/bin/bash

if [ ! -e '.customize_environment' ]; then
   echo -e "$1 .customize_environment not found!"
fi

if [ ! -e 'CORE/build/Hash-Maker' ]; then
   echo -e "$1 Hash-Maker not found!"
fi

if [ ! -e 'CORE/build/config.json' ]; then
   echo -e "$1 config.json not found!"
fi
