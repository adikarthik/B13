#!/bin/bash

echo "enter file name"
read file_name

if [ -r "$file_name" ]; then
	echo "file is readable"
else
	echo "file is not readable"
fi

