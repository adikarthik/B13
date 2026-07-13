#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

CPU=$(top -bn1 | grep Cpu | awk '{print int($8)}')
CPU_USAGE=$((100 - CPU))

TOTAL_MEM=$(free -mt | grep Total | awk '{print $2}')
USED_MEM=$(free -mt | grep Total | awk '{print $3}')
MEM_USAGE=$((USED_MEM * 100 / TOTAL_MEM))

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "CPU Usage : $CPU_USAGE%"
echo "Memory Usage : $MEM_USAGE%"
echo "Disk Usage : $DISK_USAGE%"

if [ $CPU_USAGE -ge $CPU_THRESHOLD ]
then
    echo "CPU usage is above $CPU_THRESHOLD%"
fi

if [ $MEM_USAGE -ge $MEM_THRESHOLD ]
then
    echo "Memory usage is above $MEM_THRESHOLD%"
fi

if [ $DISK_USAGE -ge $DISK_THRESHOLD ]
then
    echo "Disk usage is above $DISK_THRESHOLD%"
    echo "Deleting old log files..."

    find ~/log_backup -name "*.tar.gz" -mtime +7 -delete

    echo "Old log files deleted."
fi

echo "Monitoring completed."
