#!/bin/bash
echo "check the student pass / fail"
echo "enter the student percentage"
read input

if [ $input -ge 75 ] && [ $input -le 100 ]
then
 echo "student is topper"
elif [ $input -ge 60 ] && [ $input -le 74 ]
then
 echo "student is 1st class"
elif [ $input -ge 40 ] && [ $input -le 59 ]
then
 echo "student is 2nd class"
elif [ $input -ge 35 ] && [ $input -le 39 ]
then
 echo "student is just passed"

else
 echo "student is failed"

fi