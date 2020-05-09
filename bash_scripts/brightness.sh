#!/bin/bash
#echo 2000 > /sys/class/backlight/intel_backlight/brightness

brightness_path='/sys/class/backlight/intel_backlight/brightness'
# for future reference, this is how you get a value into a variable...
brightness=$(cat "/sys/class/backlight/intel_backlight/max_brightness")

# need spaces between brackets and inside
if [ $# -eq 1 ]
    then
sudo sh -c "echo $1 > $brightness_path"
fi
