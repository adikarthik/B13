#!/bin/bash

SERVICE="nginx"
LOGFILE="$HOME/nginx_monitor.log"

if brew services list | grep $SERVICE | grep started > /dev/null
then
    echo "$(date) - Nginx is running" >> $LOGFILE
else
    echo "$(date) - Nginx is down. Restarting..." >> $LOGFILE
    brew services start $SERVICE
    echo "$(date) - Nginx restarted" >> $LOGFILE
fi
