#!/bin/bash

variable1=$1

if [[ -n $variable1 ]]; then
	echo "I have recived input from a variable and it's: $variable1"
elif [[ -p /dev/stdin ]]; then
	read data
	echo "I have recived input from a pipe and it's: $data"
elif [[ -f /dev/stdin ]]; then
	read data
	echo "I have recived input from a file and it's: $data"
else
	echo "It's empty"
	echo "You should have put something"
fi

