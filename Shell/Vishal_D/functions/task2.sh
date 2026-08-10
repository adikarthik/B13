#!/bin/bash
#Author : Vishal dalawai
#Date : 5th April 2026
#Description: Create a function for checking diks usage

check_disk_size() {
    # To check current disk usage
    df -h > size.txt

    # Move file
    mv size.txt /home/vishal/Desktop/shellscript_files/functions

    echo "Disk size stored and moved successfully!"
}

# Call the function
