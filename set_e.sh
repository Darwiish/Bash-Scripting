#!/bin/bash

# Exits the script immediately when any command fails
set -e

echo "Befor the script"

#nonexistentcommand

echo "After the script"

echo

# Exits the script if you use an undefined variable:
set -u

x=10
y=20
z=$((x + y + w))
echo "z equals: $z"

echo
