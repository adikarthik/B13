#!/bin/bash
process="nginx"
if pgrep $process > /dev/null
then
    echo "$process is running"
else
    echo "$process is NOT running. Restarting..."
    systemctl start $process
fi
