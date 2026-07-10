
#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=85
LOG_FILE="monitor.log"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100-$8}')
CPU=${CPU%.*}

MEM=$(free | awk '/Mem:/ {print $3/$2*100}')
MEM=${MEM%.*}

DISK=$(df / | awk 'NR==2 {print $5}')
DISK=${DISK%\%}

if [ $CPU -gt $CPU_THRESHOLD ]; then
    echo "CPU usage is $CPU%" >> $LOG_FILE
fi

if [ $MEM -gt $MEM_THRESHOLD ]; then
    echo "Memory usage is $MEM%" >> $LOG_FILE
fi

if [ $DISK -gt $DISK_THRESHOLD ]; then
    echo "Disk usage is $DISK%. Cleaning old logs..." >> $LOG_FILE
    find . -name "*.log" -mtime +7 -delete
fi
