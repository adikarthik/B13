#!/bin/bash

for i in {1..20}
do
	if (( i % 3 == 0 ))
	then
	touch "file$i.txt"
else
touch "earile$i.log"
	fi
done

