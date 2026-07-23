#!/bin/bash
#Author: Srushti 
#description: log rotation of files with cronjob

LOG_DIR="/home/azureuser/shell/testlogs"

#Compress logs older than 7 days
find $LOG_DIR -name "*.log" -mtime +7 -exec gzip {} \;

#Delete logs older than 30 days
find $LOG_DIR -name "*.log.gz" -mtime +30 -exec rm {} \;

#Keep only 10 latest log files
cd $LOG_DIR
ls -t *.log* | tail -n +11 | xargs rm -f
