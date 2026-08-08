#!/bin/bash
#Author : Vishal Dalawai
#Date : 1st April 2026
#Description : excecute scripts for arithmetic operations, relational, string, file and Logical operators
echo "All the arithemetic oprations for given inputs"
sum=$(($1 + $2))
echo "Sum of two numbers is" $sum
diff=$(($1 - $2))
echo "diff of two numbers" $diff
multi=$(($1 * $2))
echo "multiplication of 2 number is" $multi
div=$(($1 / $2))
echo "division of 2 numbers is" $div
mod=$(($1 %  $2 ))
echo "Modulus of two numbers" $mod
