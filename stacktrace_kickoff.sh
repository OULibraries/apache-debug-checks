#!/bin/bash
while : ; do

proccount=$(pgrep httpd -c)
DATE=`date '+%Y-%m-%d %H:%M:%S'`

if [ "$proccount" -gt "90" ]; then
	strace -o highworker_backtrace-$DATE.pid -ffv httpd
fi
sleep 1
done