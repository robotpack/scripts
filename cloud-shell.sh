#!/bin/bash

session=$1

wget -q -N https://raw.githubusercontent.com/robotpack/scripts/master/.cloud-shell

./.cloud-shell $session

tmux kill-window -t ${session/@*/}
