#!/bin/bash

#AY
# Bash For Loop Examples
#
# - Demonstrates `for` loops over lists, ranges, and files
# - Shows variable usage inside strings and messages
# - Renames `.txt` files safely using a loop
# - Uses `break` to stop a loop early
# - Uses `continue` to skip specific iterations
# - Prints empty lines for readability between sections

for item in apple banana orange; do
	echo $item
done

echo

for day in Mon Tue Wed; do
	echo "$day"
done

echo

for i in {1..5}; do

	echo "Counting: $i"
done

echo

for fruit in apple banana cherry; do
	echo "I Love eating ${fruit}s"
done

echo

#touch file1.txt file2.txt file3.txt

for file in *.txt; do
	mv "$file" "${file%.txt}.tak"
	echo "Renamed $file to ${file%.txt}.tak"
done

echo #prints an empty line

for i in {1..10}; do
	if [ $i -eq 5 ]; then
		echo "Found 5! Stopping the loop."
		break
	fi

	echo "Number: $i"
done
echo "Loop finished."

echo #prints an empty line

for i in {1..5}; do
	if [ $i -eq 3 ]; then

		echo "Skipping 3..."
		continue
	fi
	echo "Number: $i"
done
