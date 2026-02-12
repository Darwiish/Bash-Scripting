#!/bin/bash

count=1

while [ $count -le 5 ]; do
	echo "Count: $count"
	((count++))
done

echo

fruits=("apple" "banana" "orange")
index=0

while [ $index -lt ${#fruits[@]} ]; do
	echo "Fruits: ${fruits[$index]}"
	((index++))
done

echo

cities=("Dubai" "Copenhagen" "Paris" "Amsterdam" "Oslo")
index=0

while [ $index -lt ${#cities[@]} ]; do
	city="${cities[$index]}"

	if [ ${#city} -gt 6 ]; then
		echo "City: $city(long name)"
	else
		echo "city: $city"
	fi
	((index++))
done

echo

tools=("docker" "terraform" "kubernetes" "ansible" "git")
index=0

while [ $index -lt ${#tools[@]} ]; do
	tool="${tools[$index]}"
	if [ ${#tool} -gt 6 ]; then
		echo "Tool: $tool (Long name)"
	else
		echo "tool: $tools (short name)"
	fi
	((index++))
done

echo

colors=("red" "green" "blue")
index=0
while [ $index -lt ${#colors[@]} ]; do
	echo "Number of colors: ${colors[$index]}"
	((index++))
done

echo

animals=("cat" "dog" "bird")
index=0
echo "Number of animals: ${#animals[@]}"

while [ $index -lt ${#animals[@]} ]; do
	echo "${animals[$index]}"
	((index++))
done

echo

numbers=(1 2 3)
index=0
while [ $index -lt ${#numbers[@]} ]; do
	echo "Number: ${numbers[$index]}"
	((index++))
done

echo

days=("Mon" "Tue" "Wed")
index=0

echo "Number of days: ${#days[@]}"
while [ $index -lt ${#days[@]} ]; do
	echo "Day: ${days[$index]}"
	((index++))

done

echo

count=1

while [ $count -le 6 ]; do

	echo "Count: $count "
	((count++))
done
