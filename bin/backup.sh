#!/bin/bash
# Backup the system to "Backup Arch" pen drive
veracrypt -t -l | grep 42 | awk '{print $4}' | {
  read mount
  if [ "$mount" = /mnt/veracrypt42 ]; then
    notify-send -a Backup " backup start!" |\
    cd /
    sudo rsync -aAX --info=progress2 \
      --exclude-from="/home/fwd/bin/.exclude_from_backup.txt" \
      --delete-after --delete-excluded --log-file=/var/log/arch_backup.log / "/mnt/veracrypt42" && \
    notify-send -a Backup " backup done!"
  fi
}
