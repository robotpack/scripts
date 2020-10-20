#!/bin/bash

time=2

tmux new -s _proxy
sleep $time
tmux new -s "u3f8u1" -d "./sinaldevida.sh 'u3f8u1'"
sleep $time
tmux new -s "c3a8h2" -d "./sinaldevida.sh 'c3a8h2'"
sleep $time
tmux new -s "h2u6x0" -d "./sinaldevida.sh 'h2u6x0'"
sleep $time
tmux new -s "g7n0z2" -d "./sinaldevida.sh 'g7n0z2'"
sleep $time
tmux new -s "p1z6c9" -d "./sinaldevida.sh 'p1z6c9'"
sleep $time
tmux new -s "g3x8z0" -d "./sinaldevida.sh 'g3x8z0'"
sleep $time
tmux attach -t _proxy
