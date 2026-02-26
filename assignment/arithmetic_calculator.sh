#!/bin/bash

# Basic Arithmetic Calculator

read -p "Enter First Number: " num1
read -p "Enter Second Number: " num2

# Perform arithmetic
sum=$((num1 + num2))
diff=$((num1 - num2))
multi=$((num1 * num2))

# Division with zero check
if [ "$num2" -ne 0 ]; then
	div=$((num1 / num2))
else
	div="Error (division by zero)"
fi

echo "$num1 + $num2 = $sum"
echo "$num1 - $num2 = $diff"
echo "$num1 × $num2 = $multi"
echo "$num1 ÷ $num2 = $div"
