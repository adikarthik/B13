#!/bin/bash
#date:03-04-2026
#author:swetha
#description:task3

echo "Enter first number:"
read a

echo "Enter second number:"
read b

echo "Addition: $((a + b))"
echo "Subtraction: $((a - b))"
echo "Multiplication: $((a * b))"

if [ $b -ne 0 ]; then
    echo "Division: $((a / b))"
    echo "Modulus: $((a % b))"
else
    echo "Division & Modulus not possible (division by zero)"
fi
