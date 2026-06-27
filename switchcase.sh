#!/bin/bash

echo "Enter a day:"
read day

case $day in
    Monday)
        echo "Start of the work week"
        ;;
    Friday)
        echo "Weekend is near"
        ;;
    Sunday)
        echo "Holiday"
        ;;
    *)
        echo "Regular day"
        ;;
esac
