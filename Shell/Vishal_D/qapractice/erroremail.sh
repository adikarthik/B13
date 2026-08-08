#!/bin/bash
#Author :Vishal Dalawai
#Date : 7th April 2026
#Description : Send email if job fails

touch /tmp/file1.txt
echo "Script started"

EMAIL="vishal.dalawai98@gmail.com"

if ! cp /tmp/file1.txt /tmp/backup/; then
    echo "Failure detected"
    echo "Job failed" | mail -s "Fail" "$EMAIL"
else
    echo "Success detected"
fi

echo "Script ended"