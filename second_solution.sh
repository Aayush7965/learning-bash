#!/bin/bash

# Get range
echo "Give the range to check (1-255 recommended:)"
read -p "192.168.244." first
read -p "192.168.244." last

# Populate ARP table
for (( i=$first; i<=$last; i++ ))
do
	ping -c 1 192.168.244.$i > /dev/null 2>&1 &
done

# Allow pings to finish, while entertaing the user
echo "Let's allow the computer to do all those pings..."
x=20
while [[ $x -gt 0 ]]
do
	sleep 1
	echo "T-minus $x"
	((x--))
done

# Put arp results into file for parsing
arp -a | grep : > stuff.txt
cat stuff.txt | cut -d " " -f 4 > data.txt
cat stuff.txt | cut -d " " -f 2 > ip_data.txt

# Display results
echo "Here are the IP and MAC addresses I found in our network:"

cat ip_data.txt | sed s/"("/""/g | sed s/")"/""/g > clean_ip.txt

paste clean_ip.txt data.txt > new.txt

awk {'print "IP address: " $1 " ----- MAC address: " $2'} new.txt

