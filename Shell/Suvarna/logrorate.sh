#!/bin/bash

#-------------------------------
# Configuration
#-------------------------------
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"

STORAGE_ACCOUNT="mystorageaccount"
CONTAINER="logs"

DATE=$(date +%F)

mkdir -p "$ARCHIVE_DIR"

echo "===== Log Rotation Started ====="

#----------------------------------------
# Compress all log files
#----------------------------------------

for logfile in "$LOG_DIR"/*.log
do
    if [ -f "$logfile" ]; then

        filename=$(basename "$logfile")

        gzip -c "$logfile" > "$ARCHIVE_DIR/${filename}_${DATE}.gz"

        # Empty current log
        > "$logfile"

        echo "$filename compressed."

    fi
done

echo "Compression Completed."

#----------------------------------------
# Upload to Azure Blob
#----------------------------------------

for archive in "$ARCHIVE_DIR"/*.gz
do
    az storage blob upload \
        --account-name $STORAGE_ACCOUNT \
        --container-name $CONTAINER \
        --name $(basename "$archive") \
        --file "$archive" \
        --auth-mode login

done

echo "Upload Completed."

#----------------------------------------
# Delete local archives older than 30 days
#----------------------------------------

find "$ARCHIVE_DIR" -name "*.gz" -mtime +30 -exec rm -f {} \;

echo "Old archives deleted."

echo "===== Job Completed Successfully ====="
