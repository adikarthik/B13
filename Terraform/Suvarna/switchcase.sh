#!/bin/bash
echo "demonstrating the switch-case statement"
echo "read number 1"
read num1
echo "read number 2"
read num2
echo "enter the operator in +, _, *, %, /"
read opr

case "$opr" in
"+" ) result=$(( $num1 + $num2 ))
      echo "addition of $num1 and $num2 is $result";;
"-" ) result=$(( $num1 - $num2 ))
      echo "difference of $num1 and $num2 is $result";;
"*" ) result=$(( $num1 * $num2 ))
      echo "multiplication of $num1 and $num2 is $result";;
"/" ) result=$(( $num1 / $num2 ))
      echo "division of $num1 and $num2 is $result";;
"%" ) result=$(( $num1 % $num2 ))
      echo "modulus of $num1 and $num2 is $result";;
*)
      echo " the enter $opr is not in list ";;
esac

