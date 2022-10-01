#!/bin/bash

start=`date +%s.%N`
cpuload=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
ramload=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')

cd /var/www/html
wp cron event schedule simply_static_site_export_cron --allow-root
wp cron event run --due-now --allow-root
cd /var/www/static


builddate() {
  date +"%Y/%m/%d %H:%M:%S"
}

end=`date +%s.%N`

buildtime=$( echo "$end - $start" | bc -l )

echo "$(builddate) build time ${buildtime}         cpu load: ${cpuload} ram load: ${ramload}"  >> log.txt
git add .
git commit -m "$(builddate) UTC  auto commit"
git push -u origin main --force

status=$(git status -s)
commiturl=$(git rev-parse HEAD)

/var/www/private-sripts/telegram-notf.sh "
---------------changes-----------
${status}

---------------system------------
build time ${buildtime}
cpu load: ${cpuload}
ram load: ${ramload}

-------------buildtime----------
$(builddate)

${commiturl}
"
