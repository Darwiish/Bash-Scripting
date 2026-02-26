#!/bin/bash

# File Operations Script

DIR="bash_demo"
FILE="demo.txt"
CURRENT_DATE=$(date +%Y-%m-%d)

# Create directory if it does not exist
if [ ! -d "$DIR" ]; then
	mkdir "$DIR"
	echo "Directory '$DIR' created."
fi

# Navigate into directory
cd "$DIR" || exit

# Create file and write text with current date
echo "This file was created by a Bash script on $CURRENT_DATE" >"$FILE"

echo "File '$FILE' created."

# Display file contents
echo
echo "File contents:"
cat "$FILE"
