#!/bin/bash
echo "Enter student marks:"
read marks

if [ $marks -gt 75 ] && [ $marks -le 100 ]
then
  echo "Topper"
elif [ $marks -gt 60 ] && [ $marks -le 75 ]
then
  echo "First Class"
elif [ $marks -gt 40 ] && [ $marks -le 60 ]
then
  echo "Second Class"
elif [ $marks -ge 35 ] && [ $marks -le 40 ]
then
  echo "Just Pass"
else
  echo "Fail"
fi