#!/bin/bash
while : ; do

proccount=$(pgrep httpd -c)
DATE=`date '+%Y-%m-%d %H:%M:%S'`

if [ "$proccount" -gt "90" ]; then

printf "\n----------Begin Strace----------\n" >> highworker_backtrace-$DATE
strace -o backtrace-$DATE -ffv httpd
cat backtrace* >> highworker_backtrace-$DATE
rm -f backtrace*
printf "\n----------End Strace----------\n"
printf "\n----------Begin PS----------\n" >> highworker_backtrace-$DATE
ps axjf >> highworker_backtrace-$DATE
printf "\n----------End PS----------\n" >> highworker_backtrace-$DATE
printf "\n----------Begin SS----------\n" >> highworker_backtrace-$DATE
ss -t -a -m -piostat >> highworker_backtrace-$DATE
printf "\n----------End SS----------\n" >> highworker_backtrace-$DATE
printf "\n----------Begin AUSEARCH----------\n" >> highworker_backtrace-$DATE
ausearch -c httpd -i --debug >> highworker_backtrace-$DATE
printf "\n----------End AUSEARCH----------\n" >> highworker_backtrace-$DATE
printf "\n----------Begin Log Tail----------\n" >> highworker_backtrace-$DATE
tail /var/log/httpd/*log >> highworker_backtrace-$DATE
printf "\n----------End Log Tail----------\n" >> highworker_backtrace-$DATE
printf "\n----------Begin LSOF----------\n" >> highworker_backtrace-$DATE
lsof -u apache >> highworker_backtrace-$DATE
printf "\n----------End LSOF----------\n" >> highworker_backtrace-$DATE
printf "\n----------Begin TOP----------\n" >> highworker_backtrace-$DATE
top -bH -n 1 >> highworker_backtrace-$DATE
printf "\n----------End TOP----------\n" >> highworker_backtrace-$DATE
printf "\n----------Begin IPCS----------\n" >> highworker_backtrace-$DATE
ipcs -a >> highworker_backtrace-$DATE
printf "\n----------End IPCS----------\n" >> highworker_backtrace-$DATE
printf "\n----------Begin IPCS Summary----------\n" >> highworker_backtrace-$DATE
ipcs -u >> highworker_backtrace-$DATE
printf "\n----------End IPCS Summary----------\n" >> highworker_backtrace-$DATE

fi
sleep 1
done
