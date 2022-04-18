#!/bin/bash

array=("2019-06-20" "bak" "good-KEEP" "old" "orig" "pre-upgrade")

#echo ${array[2]}

for i in ${array[@]}
do
	mkdir /etc/network/interface.$i
done
