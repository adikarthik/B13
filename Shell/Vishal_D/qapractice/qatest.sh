#!/bin/bash

cp file1.txt /tmp/

if [ $? -ne 0 ]; then
    echo "Error occurred! Exiting..."
    exit 1
fi

echo "This will not run if error happens"