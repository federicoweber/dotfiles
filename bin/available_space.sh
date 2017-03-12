#!/bin/bash

main_drive_space=$( df -h /dev/nvme0n1p7 | awk '{if(NR!=1)print $4}')
tput setaf 2; echo "" $main_drive_space
