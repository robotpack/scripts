#/bin/bash

conta=$1

user=${conta/.*/}

gam=/root/bin/gam/gam

$gam delete user $conta

$gam create user $conta firstname 'Nome' lastname 'Sobrenome' password 'tWxZxrVGfk2E2L4' org '/' changepassword off

sleep 1

python auth.py $conta

sleep 1

tmux kill-window -t $user
tmux new -s $user -d
tmux send-keys -t $user './while.sh $conta' C-m

sleep 1
