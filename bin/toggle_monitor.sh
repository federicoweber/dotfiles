#!/bin/bash

# This is used to switch from the external to the internal monitor

# External monitor
if xrandr | grep --regex="^DP1 connected"; then
  xrandr --output DP1 --auto  --output eDP1 --off --dpi 110 & \
  feh --bg-fill ~/dotfiles/wallpaper.png & \
  # update Chromium
  rm ~/.config/chromium-flags.conf &\
  killall chromium &\
  # update termite settings
  sed -i 's/font = Source Code Pro 16/font = Source Code Pro 10/g' ~/dotfiles/termite & \
  # update dunst settings
  sed -i 's/font = "Fira Sans 16"/font = "Fira Sans 10"/g' ~/dotfiles/dunst/dunstrc & \
  killall dunst & notify-send 'Display settings updated'

# Laptop monitor
else
  xrandr --output DP1 --off  --output eDP1 --auto --dpi 160 & \
  feh --bg-fill ~/dotfiles/wallpaper.png & \
  # update Chromium
  ln -s ~/dotfiles/chromium-flags.conf ~/.config/chromium-flags.conf & \
  killall chromium &\
  # update termite settings
  sed -i 's/font = Source Code Pro 10/font = Source Code Pro 16/g' ~/dotfiles/termite & \
  # update dunst settings
  sed -i 's/font = "Fira Sans 10"/font = "Fira Sans 16"/g' ~/dotfiles/dunst/dunstrc & \
  killall dunst & notify-send 'Display settings updated'
fi

# TODO
# - automate this with https://github.com/jceb/srandrd/
# - update global apps dpi settings

optirun true

i3-msg restart

