#!/bin/bash
GROUP_ID=<group_id>
BOT_TOKEN=<bot_token>

echo "/var/www/static/logs.csv" > "/var/www/static/logs_$(date "+%Y.%m.%d").csv"
echo "/var/www/static/responsetime.csv" > "/var/www/static/responsetime_$(date "+%Y.%m.%d").csv"
/var/www/private-sripts/telegram-notf.sh "@nijatoes here is your f*cking log files for $(date -I)"    
curl -F document=@"/var/www/static/logs_$(date "+%Y.%m.%d").csv" https://api.telegram.org/bot$BOT_TOKEN/sendDocument?chat_id=$GROUP_ID
curl -F document=@"/var/www/static/responsetime_$(date "+%Y.%m.%d").csv" https://api.telegram.org/bot$BOT_TOKEN/sendDocument?chat_id=$GROUP>
echo "/var/www/static/logs.csv" >> "/var/www/static/archive-logs.csv"
echo "/var/www/static/responsetime.csv" >> "/var/www/static/archive-responsetime.csv"
rm /var/www/static/logs_$(date "+%Y.%m.%d").csv /var/www/static/responsetime_$(date "+%Y.%m.%d").csv /var/www/static/logs.csv /var/www/static/responsetime.csv
