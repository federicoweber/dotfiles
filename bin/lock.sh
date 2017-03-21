#!/bin/bash

# Original script https://www.reddit.com/r/unixporn/comments/3358vu/i3lock_unixpornworthy_lock_screen/
# capture and manipulate the screen
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% \
-brightness-contrast -0x0 \
/tmp/screen.png

# add a quote
convert /tmp/screen.png \
-font fontawesome -fill '#88C0D0' -undercolor '#2E344000' \
-gravity Center -pointsize 200 -annotate +0+0 '' \
/tmp/screen.png

[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
i3lock -u -e -i /tmp/screen.png
rm /tmp/screen.png
