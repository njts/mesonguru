#!/bin/bash

memlimit=150000 # in KB
start=`date +%s.%N`
cpuload=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
ramload=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')

# Build static website
cd /var/www/html
wp cron event schedule simply_static_site_export_cron --allow-root
wp cron event run --due-now --allow-root
cd /var/www/static
status=$(git diff --name-only)

# Time stamp
builddate() {
  date +"%Y/%m/%d %H:%M:%S"
}
end=`date +%s.%N`
buildtime=$( echo "$end - $start" | bc -l )
echo "$(builddate) build time ${buildtime}         cpu load: ${cpuload} ram load: ${ramload}"  >> log.txt

# Github push
git add .
git commit -m "$(builddate) UTC  auto commit"
git push -u origin main --force


# Telegram notification
/var/www/private-sripts/telegram-notf.sh "
|--------------changes-----------|
${status}
                       |
|---------------system------------|
| build time ${buildtime}
| cpu load: ${cpuload}
| ram load: ${ramload}
                       |
|------------build date----------|
| $(builddate)
|--------------------------------------|
"
/var/www/private-sripts/mem-check.sh
