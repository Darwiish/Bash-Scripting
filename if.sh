#!/bin/bash

# Bash If Statement
#
# - Demonstrates basic if/else conditions
# - Uses command-line arguments for numeric comparison
# - Performs string comparison
# - Uses logical operators (AND)
# - Shows if-elif-else grading logic
# - Demonstrates nested if statements
# - Prints formatted output with spacing for readability

age=$1

if [ $age -gt 18 ]; then
	echo "You are an adult"
else
	echo "You are a minor"
fi

echo #prints an empty line

name="Alice"

if [ "$name" == "Alice" ]; then
	echo "Yo, Alice"

fi

echo #prints an empty line

grade=95

if [ $grade -ge 90 ] && [ $grade -le 100 ]; then
	echo "Excellent"
fi

echo #prints an empty line

scoree=$1

if [ "$scoree" -ge 90 ]; then
	echo "Excellent"
elif [ "$scoree" -ge 80 ]; then
	echo "Good"
else
	echo "Good Luck Next Time"
fi

echo #prints an empty line

age=18
grade=85

if [ $age -gt 18 ]; then
	echo "You are elegible based on age"
	if [ $grade -ge 80 ]; then
		echo "You are elegible based on grade"
		echo "Congrats! You in"
	else
		echo "Sorry grade down"
	fi
else
	echo "Sorry, You are not Elegible"
fi

echo #prints an empty line
score=65

if [ $score -ge 90 ]; then
	echo "Grade: A"
elif [ $score -ge 80 ]; then
	echo "Grade: B"
elif [ $score -ge 70 ]; then
	echo "Grade: C"
else
	echo "Grade: F"
fi
