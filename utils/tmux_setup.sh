#!/bin/sh
tmux new-session -s "tmux" -d -n 'darts' -c ~/Work/darts
tmux new-window -n 'dom' -c ~/Work/dom/
tmux new-window -n 'viz' -c ~/Work/viz/
tmux -2 attach-session -d 
