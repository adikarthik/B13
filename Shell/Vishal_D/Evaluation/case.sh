#!/bin/bash
echo " performing arithmetic operation based on user input"
echo "enter the num1"
read num1
echo "enter the num2"
read num2
echo "select the operator to perform the atsk : + , - , * , / , %"
read opr

case $opr in
"+") result=$(( $num1 + $num2 ))
echo "addition of 2 number" $result ;;
"-") result=$(( $num1 - $num2 ))
echo "Diff of 2 number" $result ;;
"*") result=$(( $num1 * $num2 ))
echo "Multi of 2 number" $result ;;
"/") result=$(( $num1 / $num2 )) 
echo "Division of 2 number" $result;;
"%") result=$(( $num1 % $num2 ))
echo "Modulus of 2 number" $result ;;
esac
