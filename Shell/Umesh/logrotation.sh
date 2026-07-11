#!/bin/bash

LOG_DIR="$HOME/myapp"
ARCHIVE_DIR="$HOME/archive"
DATE=$(date +%F)

mkdir -p $ARCHIVE_DIR

echo "Compressing logs..."
tar -czf $ARCHIVE_DIR/logs_$DATE.tar.gz $LOG_DIR/*.log

echo "Clearing old logs..."
> $LOG_DIR/app.log

echo "Deleting old archives..."
find $ARCHIVE_DIR -type f -mtime +7 -delete

echo "Task completed"
