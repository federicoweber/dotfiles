#!/bin/sh
upower -i /org/freedesktop/UPower/devices/battery_BAT0 \
  | grep 'state\|percentage' |awk '{gsub ("%", ""); print $2}' | {
  read -r status; read -r capacity
  if [ "$status" = discharging -a "$capacity" -lt 10 ]; then
    notify-send -h int:value:$capacity -a battery -u critical " "
    export BATTERY_LEVEL_NOTIFIED="true"
  fi
}
