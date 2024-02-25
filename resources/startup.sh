#!/bin/bash
devilspie2 &
tmux kill-session -t Deskterm || true
tmux new-session -d -s Deskterm
sleep 0.1
BASH_POST_RC="alias exit='echo Not exiting, running as background.'; alias yexit='exec bash exit'" gnome-terminal --window-with-profile=Deskterm --role=Deskterm --hide-menubar -- bash -c "tmux attach -t Deskterm"
sleep 0.1
tmux set-option -t Deskterm -g status off
tmux set-option -t Deskterm -g pane-border-style bg=default,fg=darkgrey
tmux set-option -t Deskterm -g pane-active-border-style bg=default,fg=darkgrey
tmux split-window -t Deskterm:0.0 -h
tmux split-window -t Deskterm:0.0 -h
tmux select-layout -t Deskterm even-horizontal
tmux split-window -t Deskterm:0.2
tmux split-window -t Deskterm:0.1
tmux split-window -t Deskterm:0.0

tmux send-keys -t Deskterm:0.1 "tput civis" Enter

tmux send-keys -t Deskterm:0.0 "~/.deskterm/scripts/battery.sh" Enter
tmux send-keys -t Deskterm:0.1 "~/.deskterm/scripts/processes.sh" Enter
tmux send-keys -t Deskterm:0.2 "~/.deskterm/scripts/internet.sh" Enter
tmux send-keys -t Deskterm:0.3 "~/.deskterm/scripts/sensors.sh" Enter
tmux send-keys -t Deskterm:0.4 "~/.deskterm/scripts/disk.sh" Enter
tmux send-keys -t Deskterm:0.5 "~/.deskterm/scripts/nvtop.sh" Enter
