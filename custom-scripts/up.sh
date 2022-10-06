#!/bin/bash
        
        FILE=errors.txt
        TARGET=192.168.0.100000

          touch $FILE
          while true;
          do
            DATE=$(date '+%d/%m/%Y %H:%M:%S')
            ping -c 1 $TARGET &> /dev/null
            if [[ $? -ne 0 ]]; then
              echo "ERROR "$DATE
              echo $DATE >> $FILE
             /var/www/private-sripts/telegram-notf.sh "@nijatoes f*cking server is down"
            else
              echo "OK "$DATE
            fi
              sleep 5
          done
