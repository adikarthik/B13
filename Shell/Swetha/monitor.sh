#!/bin/bash
#How do you monitor CPU and memory usage and send an alert when thresholds are exceeded also auto-clean old logs when disk is nearly full?
email=swetha@gmail.com

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int(100-$8)}')
MEM=$(free | awk '/Mem/ {print int($3/$2*100)}')
DISK=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

if [ "$CPU" -gt 80 ]; then
    echo "ALERT: CPU usage is $CPU%" | mail -s “CPU is exceeding limit ” $email
fi

if [ "$MEM" -gt 80 ]; then
    echo "ALERT: Memory usage is $MEM%" | mail -s “memory  is exceeding limit ” $email
fi

if [ "$DISK" -gt 90 ]; then
    echo "ALERT: Disk usage is $DISK%" | mail -s “disk is exceeding limit ” $email
    echo "Cleaning old logs..."
    find /var/log -type f -name "*.log" -mtime +7 -delete
fi
