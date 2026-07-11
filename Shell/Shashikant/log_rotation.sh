
#!/bin/bash

LOG_DIR="/home/shashi/Desktop/QA_Tasks/logs"
BACKUP_DIR="/home/shashi/Desktop/QA_Tasks/log_backup"

DATE=$(date +%Y-%m-%d)

tar -czf $BACKUP_DIR/app_logs_$DATE.tar.gz $LOG_DIR/*.log

find $BACKUP_DIR -name "*.tar.gz" -mtime +30 -delete
