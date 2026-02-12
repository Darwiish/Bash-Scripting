#!/bin/bash
#AY
# Bash Case Statement
#
# - Validates that exactly one argument is provided
# - Uses a case structure to process user input
# - Checks whether the input is a file or directory
# - Displays file size for regular files
# - Counts items inside a directory
# - Handles invalid input gracefully with error messages
# Check if exactly one argument is provided

if [ $# -ne 1 ]; then
	echo "Usage: $0 <filename_or_directory>"
	exit 1
fi

input="$1"

# Use case to handle different types
case "$input" in
# Regular file
*)
	if [ -f "$input" ]; then
		# Print file size
		size=$(ls -lh "$input" | awk '{print $5}')
		echo "File: $input"
		echo "Size: $size"

	# Directory
	elif [ -d "$input" ]; then
		count=$(ls -1A "$input" | wc -l)
		echo "Directory: $input"
		echo "Contains: $count items"

	# Not a file or directory
	else
		echo "'$input' is not a valid file or directory."
		exit 1
	fi
	;;
esac
