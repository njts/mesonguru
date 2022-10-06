#!/bin/bash
        
if curl -s --head  --request GET https://meson.guru | grep "200 OK" > /dev/null; then 
   echo "mysite.com is UP"
else
   /var/www/private-sripts/telegram-notf.sh "@nijatoes f*cking server is down"
fi
