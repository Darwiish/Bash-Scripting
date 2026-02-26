#!/bin/bash

#Add content to the file
echo "Read Me Line" >./file1.txt
echo "Read again" >>./file1.txt
echo "Well Done" >>./file1.txt

#Add multiple lines at once using cat:
cat >file2.txt <<EOF
File Two
Multiple Lines
At once Using cat
EOF

echo

cat >file3.txt <<EOF
Focus on reading files and learn different techniques
to extract data and process information from them. 
Reading files is an important task in scripting. 
It allows us to access and extract valuable information
from various types of files.
EOF

read_file() {
	local file_path="$1"
	while IFS= read -r line; do
		echo "$line"
	done <"$file_path"
}

echo

process_file() {
	local file_path="$1"
	cat "$file_path" | while IFS= read -r line; do
		echo "Processing line: $line"
	done
}
read_file "./file1.txt"
echo
read_file "./file2.txt"
echo
process_file "./file3.txt"
