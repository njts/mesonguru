#!/bin/bash
/usr/bin/tmux new-session -s -d ENTER
/usr/bin/tmux detach -s ENTER
sleep 3
tmux send-keys -t 0 "/var/www/static/custom-scripts/auto-git.sh" Enter
