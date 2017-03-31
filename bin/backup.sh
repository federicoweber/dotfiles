#!/bin/bash
# Backup the system to "Backup Arch" pen drive
cd /
sudo rsync -aAX --info=progress2 --exclude-from="/home/fwd/bin/.exclude_from_backup.txt" --delete-after --delete-excluded --log-file=/var/log/arch_backup.log / "/mnt/veracrypt42"
