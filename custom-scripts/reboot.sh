#!/bin/bash

cpuload=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
ramload=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')

rebootdate() {
  date +"%Y/%m/%d %H:%M:%S"
}

/var/www/private-sripts/telegram-notf.sh "
#REBOOT $(rebootdate)
---------------system------------
cpu load: ${cpuload}
ram load: ${ramload}

Bless! 🩴
"

reboot
