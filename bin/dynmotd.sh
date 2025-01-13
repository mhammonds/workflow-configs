#!/bin/bash

# Gather basic diagnostics
USER=$(whoami)
HOSTNAME=$(uname -n)
ROOT=$(df -Ph / | awk 'NR==2 {print $4}')
PSA=$(ps -ax | wc -l | tr -d ' ')

# Time of day
HOUR=$(date +"%H")
if [ $HOUR -lt 12 -a $HOUR -ge 0 ]; then
    TIME="morning"
elif [ $HOUR -lt 17 -a $HOUR -ge 12 ]; then
    TIME="afternoon"
else
    TIME="evening"
fi

# OS-specific information gathering
if [ "$(uname)" == "Darwin" ]; then
    # macOS specific commands
    RELEASE=$(sw_vers -productVersion)
    LOAD1=$(sysctl -n vm.loadavg | awk '{print $2}')
    LOAD5=$(sysctl -n vm.loadavg | awk '{print $3}')
    LOAD15=$(sysctl -n vm.loadavg | awk '{print $4}')
    
    # Memory information for macOS
    TOTAL_MEM=$(sysctl -n hw.memsize | awk '{print $1/1024/1024 " MB"}')
    # Calculate used memory from vm_stat
    pageSize=$(vm_stat | awk '/page size of/{print $8}')
    activePages=$(vm_stat | awk '/Pages active/{print $3}' | tr -d '.')
    USED_MEM=$((pageSize * activePages / 1024 / 1024))" MB"
    
    # Swap information
    SWAP=$(sysctl vm.swapusage | awk '{print $4}' | tr -d 'M')
    
    # System uptime for macOS
    boot_time=$(sysctl -n kern.boottime | awk '{print $4}' | tr -d ',')
    current_time=$(date +%s)
    uptime=$((current_time - boot_time))
    
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux specific commands
    if [ -f /etc/os-release ]; then
        RELEASE=$(cat /etc/os-release | grep "PRETTY_NAME" | cut -d'"' -f2)
    elif [ -f /etc/redhat-release ]; then
        RELEASE=$(cat /etc/redhat-release)
    else
        RELEASE="Unknown Linux distribution"
    fi
    
    LOAD1=$(cat /proc/loadavg | awk '{print $1}')
    LOAD5=$(cat /proc/loadavg | awk '{print $2}')
    LOAD15=$(cat /proc/loadavg | awk '{print $3}')
    
    # Memory information for Linux
    TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2" MB"}')
    USED_MEM=$(free -m | awk '/Mem:/ {print $3" MB"}')
    
    # Swap information
    SWAP=$(free -m | awk '/Swap:/ {print $3}')
    
    # System uptime for Linux
    uptime=$(cat /proc/uptime | cut -f1 -d.)
fi

# Calculate uptime in days, hours, minutes, seconds
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))

# Output
echo "Good $TIME $USER
===========================================================================
 - Hostname............: $HOSTNAME
 - Release.............: $RELEASE
 - Users...............: Currently $(users | wc -w) user(s) logged on
===========================================================================
 - Current user........: $USER
 - CPU usage...........: $LOAD1, $LOAD5, $LOAD15 (1, 5, 15 min)
 - Memory used.........: $USED_MEM / $TOTAL_MEM
 - Swap in use.........: $SWAP MB
 - Processes...........: $PSA running
 - System uptime.......: $upDays days $upHours hours $upMins minutes $upSecs seconds
 - Disk space ROOT.....: $ROOT remaining
===========================================================================
\"The programmer, like the poet, works only slightly removed from pure
thought-stuff. He builds castles in the air, from air, creating by
exertion of the imagination.\" -Frederick Brooks"
