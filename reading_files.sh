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

read_file() {

	local file_path="$1"

	while IFS= read -r line; do
		echo "$line"
	done <"$file_path"
}

read_file "./file1.txt"
echo
read_file "./file2.txt"
