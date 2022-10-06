#!/bin/bash
        
        FILE=errors.txt
        TARGET=meson.guru

          touch $FILE
          while true;
          do
if curl -s --head  --request GET https://example.com | grep "200 OK" > /dev/null; then 
   echo "mysite.com is UP"
else
   /var/www/private-sripts/telegram-notf.sh "@nijatoes f*cking server is down"
sleep 5
  fi
