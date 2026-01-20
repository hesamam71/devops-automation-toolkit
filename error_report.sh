#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "Run as root!!!!!" && exit 1
fi

if [ ! -f "$1" ]; then
	echo "File not exist" && exit 1
fi
a=$(awk '$4 == 404 { print $1 }' "$1")
echo "===suspicious IP---"
echo "$a"
