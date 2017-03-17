# This is ugly but it's a temporary fix to remap touchpad
synclient VertScrollDelta=-111 \
  TapButton1=1 \
  TapButton2=3 \
  TapButton3=2 \
  PalmDetect=1 \
  HorizTwoFingerScroll=1\
  PalmMinWidth=8\
  PalmMinZ=100
xmodmap .Xmodmap
