#!/bin/bash

memlimit=150000 # in KB

# Reboot if memeory is lower than memory limit
mem=$(cat /proc/meminfo | egrep "^MemFree" |awk '{print $2}')
if (( mem <= $memlimit )); then
/var/www/private-sripts/telegram-notf.sh "Free memory is $(($mem/1024)) MB and it's lower than $(($memlimit/1024)) MB limit, so we restart >
/var/www/static/custom-scripts/reboot.sh
else
/var/www/private-sripts/telegram-notf.sh "Memory is fine. $(($mem/1024)) MB is free"
fi
