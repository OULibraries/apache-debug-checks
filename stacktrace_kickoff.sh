#!/bin/bash

DATE=`date '+%Y-%m-%d-%Hh%Mm'`

printf "\n----------Begin Strace----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
strace -o /var/log/apache-debug-checks/backtrace-"${DATE}" -ffv httpd
cat /var/log/apache-debug-checks/backtrace* >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
rm -f /var/log/apache-debug-checks/backtrace*
printf "\n----------End Strace----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------Begin PS----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
ps axjf >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------End PS----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------Begin SS----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
ss -t -a -m -piostat >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------End SS----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------Begin AUSEARCH----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
ausearch -c httpd -i --debug >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------End AUSEARCH----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------Begin Log Tail----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
tail /var/log/httpd/*log >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------End Log Tail----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------Begin LSOF----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
lsof -u apache >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------End LSOF----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------Begin TOP----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
top -bH -n 1 >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------End TOP----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------Begin IPCS----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
ipcs -a >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------End IPCS----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------Begin IPCS Summary----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
ipcs -u >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
printf "\n----------End IPCS Summary----------\n" >> /var/log/apache-debug-checks/highworker_backtrace-"${DATE}"
