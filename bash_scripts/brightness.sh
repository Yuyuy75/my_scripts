#!/bin/bash

brightness_path='/sys/class/backlight/intel_backlight/brightness'
# for future reference, this is how you get a value into a variable...
brightness=$(cat "/sys/class/backlight/intel_backlight/max_brightness")
max_brightness=$brightness

# need spaces between brackets and inside
if [ $# -eq 1 ]
    then
sudo sh -c "echo $1 > $brightness_path"
exit 0
fi

echo -e "wrong number of args\n\
usage: script [1 - $max_brightness]"
exit 1
# print error if $1 is greater than max_brightness
# print error if $# is not exactly 1
