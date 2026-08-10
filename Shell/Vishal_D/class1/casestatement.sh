#!/bin/bash
echo "perform arithmetic operation for 2 inputs"
echo "enter num1"
read num1
echo "enter num2"
read num2
echo "enter the arithmetic any operator + , - , * / "
read opr

case "$opr" in 

"+") result=$(($num1 + $num2))
 echo "addition of two num is $result" ;;
"-") result=$(($num1 - $num2))
 echo "Differnce of two num is $result" ;;
"*") result=$(($num1 * $num2))
 echo "Multiplication of two num is $result" ;;
"/") result=$(($num1 / $num2))
 echo "divison of two num is $result" ;;
*) echo "its not an valid operator $opr ";;
esac

