#!/bin/bash
source_dir="/home/hesam/git/devops-automation-toolkit"
backup_dir="/home/hesam/backupdaily"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)

filename="backup-$timestamp.tar.gz"

if [ ! -d "$backup_dir" ]; then
	mkdir "$backup_dir"
fi

tar --absolute-names -czf "$backup_dir/$filename" "$source_dir" 2> /dev/null
output=$?
if [ $(echo $output) -eq 0 ]; then
	echo "Backup successful at $backup_dir/$filename"
else
	echo "Backup failed with $echo $output"
	exit 1
fi


#if [ -f "$backup_dir/$filename" ]; then
#	echo "the backup complete with $filename name"
#else
#	echo "ERROR BACKUP"
#	exit 1
#fi
