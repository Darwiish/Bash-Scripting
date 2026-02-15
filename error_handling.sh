#!/bin/bash

num1=10
num2=0

# --- Division Check/ Exit Codes ---
if [ $num2 -eq 0 ]; then
	echo "Error: Division by zero is not allowed"
	#exit 1
else

	result=$((num1 / num2))
	echo "The result is $result"
fi

echo

# --- File Check ---
FILE="/nonexistent"

if [[ -f "$FILE" ]]; then
	echo "File exists: $FILE"
else
	echo "File does not exist: $FILE"
fi

echo

# --- Git Check ---

#command -v git 2>/dev/null
#if [[ $? -ne 0 ]]; then
if ! command -v git &>/dev/null; then
	echo "git is not installed. please install git."
	exit 1
else
	echo "git is installed"
fi
