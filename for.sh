#!/bin/bash

for item in apple banana orange; do
	echo $item
done

echo #prints an empty line

for day in Mon Tue Wed; do
	echo "$day"
done

echo #prints an empty line

for i in {1..5}; do

	echo "Counting: $i"
done

echo #prints an empty line

for fruit in apple banana cherry; do
	echo "I Love eating ${fruit}s"
done

echo #prints an empty line

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
