#!/bin/bash

if [[ -p /dev/stdin ]] || [[ -f /dev/stdin ]]; then
	echo "I have recived data from STDIN!"
	read data
else
	echo "I have not recived any data from STDIN!"
	read -p "Please provide data: " data
fi

echo
echo "The data that you provides is: $data"
