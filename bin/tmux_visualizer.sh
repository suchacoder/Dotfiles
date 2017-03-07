#!/bin/bash
SESSION=ncmpcpp

tmux -2 has-session -t $SESSION
if [ $? -eq 0 ]; then
	tmux -2 attach -t $SESSION
	exit 0;
fi

tmux -2 new-session -d -s $SESSION 'ncmpcpp -s playlist'
tmux -2 split-window -d -t $SESSION:0 -p 45 'ncmpcpp -s visualizer'
tmux -2 select-pane -t $SESSION:0.1
tmux -2 select-pane -t $SESSION:0.0

# 1.1 is DOWN
for i in "\\"
	do tmux -2 send-keys -t $SESSION:0.1 "$i"
done

# 1.0 is UP
for i in "C-l" "Enter" "2"
	do tmux -2 send-keys -t $SESSION:0.0 "$i"
done

tmux -2 set -t $SESSION -g status off

tmux -2 attach-session -t $SESSION
