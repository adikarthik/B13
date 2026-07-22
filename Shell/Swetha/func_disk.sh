#!/bin/bash
#date:04-04-26
#author:swetha
#description:task

# function definition
check_disk() {
    df -h > size.txt
    echo "Disk size stored in size.txt"

    mkdir -p backup
    mv size.txt backup/
    echo "File moved to backup directory"
}

# function call
check_disk
