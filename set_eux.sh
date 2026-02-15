#!/bin/bash

#  Print each command before running it (debug mode)
set -x

echo "Starting script"
x=10
y=20
z=$((x + y))
echo "The value of z is: $z"

echo

set -eux

echo "This is a test"

echo "The value of x is: $x"

nonexistentcommand
