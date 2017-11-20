#!/bin/bash

# This is used to switch from the external to the internal monitor

if xrandr | grep --regex="^DP1 connected"; then
  xrandr --output DP1 --auto  --output eDP1 --off --dpi 110 && \
  feh --bg-center ~/dotfiles/wallpaper.png
else
  xrandr --output DP1 --off  --output eDP1 --auto --dpi 160 && \
  feh --bg-center ~/dotfiles/wallpaper.png
fi

# TODO
# - automate this with https://github.com/jceb/srandrd/
# - update global apps dpi settings
# - update Chromium dpi settings and restart
# - update termite config and restart
# - update dunst config and restart
# - regenerate the wallpaper
# - move audio to external monitor

i3-msg restart

