#!/bin/bash
#date:4-4-2026
#author:swetha
#description:practie copy and remove file

fi


file="team1"

if [ -f "$file" ]; then
    echo "File exists: $file"

    # Rename file
    mv "$file" teamfile
    echo "File renamed to teamfile"

else
    echo "File doesn't exist, creating file..."
    touch "$file"
    echo "File created: $file"
fi
