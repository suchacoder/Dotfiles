#!/bin/bash
tmux new-session -d
tmux new-window '~/bin/cover.sh'
tmux split-window -v 'ncmpcpp'
tmux select-pane -U
tmux split-window -h -l 174 'cava'
tmux select-pane -D
tmux a
