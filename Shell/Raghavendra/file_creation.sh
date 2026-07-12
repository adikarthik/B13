#!/bin/bash
# Create 20 files
for i in {1..20}
do
    if [ $i -le 3 ]; then
        touch "file$i.txt"
    else
        touch "file$i.log"
    fi
done

echo "20 files created: 3 txt and 17 log"