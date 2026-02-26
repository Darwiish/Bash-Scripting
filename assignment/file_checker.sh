#!/bin/bash

# File Permission Checker Script

FILE=$1

# Check if filename is provided
if [ -z "$FILE" ]; then
	echo "Usage: $0 <filename>"
	exit 1
fi

# Check if the file exists
if [ -e "$FILE" ]; then
	echo "The file $FILE exists."

	[ -r "$FILE" ] && echo "Readable"

	# Check permissions
	if [ -r "$FILE" ]; then
		echo "   [Readable]: Yes"
	else
		echo "   [Readable]: No"
	fi

	if [ -w "$FILE" ]; then
		echo "   [Writable]: Yes"
	else
		echo "   [Writable]: No"
	fi

	if [ -x "$FILE" ]; then
		echo "   [Executable]: Yes"
	else
		echo "*   [Executable]: No"
	fi

else
	echo "The file $FILE does not exist."
fi
