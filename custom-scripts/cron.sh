#!/bin/bash

tmux new -s bot

tmux send-keys -t bot "/var/www/static/custom-scripts/auto-git.sh" Enter
