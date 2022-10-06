#!/bin/bash
/usr/bin/tmux new-session -d -s ENTER
/usr/bin/tmux detach -s ENTER
sleep 3
/usr/bin/tmux send-keys -t 0 "/var/www/private-sripts/telegram-notf.sh REBOOTED" Enter
