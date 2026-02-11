#!/bin/bash

count=1

while [ $count -le 6 ]; do
	echo "Count: $count "
	((count++))
done

echo #prints an empty line

fruits=("apple" "banana" "kiwi")
index=0

while [ $index -lt ${#fruits[@]} ]; do
	fruit="${fruits[$index]}"

	if [ ${#fruit} -gt 5 ]; then
		echo "Fruit: $fruit(Long name)"
	else
		echo "fruit: $friut"
	fi
	((index++))
done

echo #prints an empty line

numbers=(1 2 3 4 5 6 7 8 9 10)
index=0

while [ $index -lt ${#numbers[@]} ]; do
	number="${numbers[$index]}"

	if [ $((number % 2)) -eq 0 ]; then

		echo "Even number: $number"
	fi
	((index++))
done
echo #prints an empty line

days=("Mon" "Tue" "Wed" "Thu")
index=0

while [ $index -lt ${#days[@]} ]; do
	day="${days[$index]}"
	echo "Day: $day"
	((index++))
done

echo #prints an empty line

days=("Mon" "Tue" "Wed" "Thu")
index=0

echo "Number of days: ${#days[@]}"

while [ $index -lt ${#days[@]} ]; do
	echo "Day $((index + 1)): ${days[$index]}"
	((index++))
done

echo #prints an empty line
count=1

while [ $count -le 5 ]; do
	if [ $((count % 2)) -eq 0 ]; then
		echo "Even number: $count"

	else
		echo "Number: $count"
	fi

	((count++))
done
