#!/bin/bash
#Author: Srushti 
#description: Disk cleanup

#Checks disk usage and sends alert if usage exceeds 90%

USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

if [ $USAGE -gt 90 ];
then
 echo "WARNING: Disk usage is at $USAGE%!"
fi

#Cleans up temporary files older than 3 days (hide permission errors)
find /tmp -type f -mtime +3 -exec rm -f {} \; 2>/dev/null

#Removes empty log files
find /home/azureuser/shell/testlog -type f -name "*.log" -empty -exec rm -f {} \; 2>/dev/null

echo "Disk cleanup is completed"

