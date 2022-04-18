#!/bin/bash

num=0
echo "Starting While loop"
while [[ $num -lt 5 ]] 
do
	echo "Our number is currently $num"
	((num++))
done
echo
echo "Starting Until loop"
until [[ $num -lt 1 ]]
do
	echo "Our number is currently $num"
	let "num=num-1"
done

echo
echo "END"
