#!/bin/bash
GROUP_ID=<group_id>
BOT_TOKEN=<bot_token>

/var/www/private-sripts/telegram-notf.sh "@nijatoes here is your f*cking log files"    
curl -F document=@"/var/www/static/logs.csv" https://api.telegram.org/bot$BOT_TOKEN/sendDocument?chat_id=$GROUP_ID 
curl -F document=@"/var/www/static/responsetime.csv" https://api.telegram.org/bot$BOT_TOKEN/sendDocument?chat_id=$GROUP_ID
