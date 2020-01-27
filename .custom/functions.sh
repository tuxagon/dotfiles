#!/bin/bash

function adjust_brightness() {
  local brightness_file="/sys/class/backlight/intel_backlight/brightness"

  local amt="$1"
  local max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
  local cur=$(cat $brightness_file)

  cur=$((cur + amt))

  if [ $cur -gt $max ]; then
    echo -n "$max" > "$brightness_file"
  elif [ $cur -lt 10 ]; then
    echo -n "10" > "$brightness_file"
  else
    echo -n "$cur" > "$brightness_file"
  fi
}
