#!/bin/bash

read -p "enter target ip: " IP
echo "scanning $IP"
nmap -v $IP | grep "open" >> scan_result.txt

echo "text has written in scan_result.txt"

cat scan_result.txt


