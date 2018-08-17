#!/bin/sh
upower -i /org/freedesktop/UPower/devices/battery_BAT0 \
  | grep 'state\|percentage' |awk '{gsub ("%", ""); print $2}' | {
  read -r status; read -r capacity
  if [ "$status" = discharging -a "$capacity" -lt 12 ]; then
    notify-send -h int:value:$capacity -a battery -u critical " "
  fi
  if [ "$status" = discharging -a "$capacity" -lt 8 ]; then
    ~/bin/lock.sh && systemctl hibernate
  fi
}
