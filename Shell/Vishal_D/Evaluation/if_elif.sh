#!/bin/bash
echo "enter the marks to check student is failed or passed"
read marks

if [ $marks -gt 75 ] && [ $marks -le 100 ]
then
echo " student is topper"
elif [ $marks -gt 50 ] && [ $marks -le 75 ]
then
echo " student is second class"
elif [ $marks -gt 35 ] && [ $marks -le 50 ]
then
echo " student is passed"
else
echo " student is falied"
fi


