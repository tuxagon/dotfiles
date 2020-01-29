#!/bin/sh

brightness_file="/sys/class/backlight/intel_backlight/brightness"

amt="$1"
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
cur=$(cat $brightness_file)

cur=$((cur + amt))

if [ $cur -gt $max ]; then
  echo -n "$max" > "$brightness_file"
elif [ $cur -lt 10 ]; then
  echo -n "10" > "$brightness_file"
else
  echo -n "$cur" > "$brightness_file"
fi
