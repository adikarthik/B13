#!/bin/bash

i=1
until [ $i -gt 5 ]
do
    echo "Number: $i"
    ((i++))
done
