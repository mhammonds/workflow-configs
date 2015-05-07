#!/bin/bash

# Gather Diagnostics
USER=`whoami`
HOSTNAME=`uname -n` 
ROOT=`df -Ph | grep root | awk '{print $4}' | tr -d '\n'`

MEMORY1=`free -t -m | grep "buffers/cache" | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`
PSA=`ps -Afl | wc -l` 

# Time of day 
HOUR=$(date +"%H")
if [ $HOUR -lt 12  -a $HOUR -ge 0 ] 
then    TIME="morning"
elif [ $HOUR -lt 17 -a $HOUR -ge 12 ]
then    TIME="afternoon"
else
    TIME="evening"
fi

# System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))

# System load
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`

echo "Good $TIME $USER
===========================================================================
 - Hostname............: $HOSTNAME
 - Release.............: `cat /etc/redhat-release`
 - Users...............: Currently `users | wc -w` user(s) logged on
===========================================================================
 - Current user........: $USER
 - CPU usage...........: $LOAD1, $LOAD5, $LOAD15 (1, 5, 15 min)
 - Memory used.........: $MEMORY1 / $MEMORY2
 - Swap in use.........: `free -m | tail -n 1 | awk '{print $3}'` MB
 - Processes...........: $PSA running
 - System uptime.......: $upDays days $upHours hours $upMins minutes $upSecs sec
 - Disk space ROOT.....: $ROOT remaining
===========================================================================

\"The programmer, like the poet, works only slightly removed from pure
thought-stuff. He builds castles in the air, from air, creating by
exertion of the imagination.\" -Frederick Brooks 
"
