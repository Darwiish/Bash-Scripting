#!/bin/bash

hello_world() {
	echo "Hello Mate"
}
hello_world

echo # printes an empty line

greet_person() {

	local name="$1"
	echo "Hello: $name"
}
greet_person "GG"

echo # printes an empty line

greet() {
	local name

	if [ $# -eq 0 ]; then
		echo "What is your name?"
		read name
	else
		name="$1"
	fi

	echo "Hello, $name!"
}
greet

echo # printes an empty line

get_date() {
	echo "$(date)"
}
get_date

echo # printes an empty line

today=$(get_date)
echo "Today is $today"

echo # printes an empty line

if [ -z "$1" ]; then
	echo "Error: No argument provided"
	exit 1
fi

echo # printes an empty line
