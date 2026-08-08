#!/bin/bash
echo "enter the num1"
read num1
echo "enter the num2"
read num2

addition () {
sum=$(( $num1 + $num2 ))
echo "addition of code" $sum
}
difference () {
diff=$(( $num1 - $num2 ))
echo "addition of code" $diff
}

addition
difference