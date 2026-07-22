#!/bin/bash
#date:04-04-2026
#author:swetha
#description:practice

for i in {1..5}
do
    if [ $((i % 2)) -eq 0 ]; then
        touch file$i.txt
    else
        touch file$i.log
    fi
done
