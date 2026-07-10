#!/bin/bash


# Function to check size of disk

check_disk() {
    df -h > size.txt
    echo "Disk size stored in size.txt"

    # Create directory if not exists
    mkdir -p ~/task1/disk_reports

    # Move file
    mv size.txt ~/task1/disk_reports/
    echo "File moved to /task1/disk_reports"
}

check_disk
