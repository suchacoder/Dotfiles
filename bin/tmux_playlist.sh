#!/bin/bash
SESSION=ncmpcpp

tmux -2 has-session -t $SESSION
if [ $? -eq 0 ]; then
	tmux -2 attach -t $SESSION
	exit 0;
fi

tmux -2 new-session -d -s $SESSION 'ncmpcpp -s playlist'

for i in "C-l" "Enter" "2"
	do tmux -2 send-keys -t $SESSION:0.0 "$i"
done

tmux -2 set -t $SESSION -g status off

tmux -2 attach-session -t $SESSION
