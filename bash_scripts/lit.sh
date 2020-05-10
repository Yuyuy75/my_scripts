#!/bin/bash

brightness_path='/sys/class/backlight/intel_backlight/brightness'
#   for future reference, this is how you get a... 
#+  value into a variable
brightness=$(cat "/sys/class/backlight/intel_backlight/max_brightness")
max_brightness=$brightness

# need spaces between brackets and inside
if [ $# -eq 1 ]
    then
    brightness_percent=$( echo "scale=0; ($1 % 100 * $max_brightness)/1" | bc )
    if [ $1 -gt 1 ]
        then
        echo -e "Brightness value too high!\n\
Enter a number in the range [0.0... - 1.0...]"
        exit 2
    fi
    if [ $1 -lt 0 ]
        then
        echo -e "Brightness value too low!\n\
Enter a number in the range [0.0... - 1.0...]"
        exit 2
    fi
    #echo $brightness_percent
    sudo sh -c "echo $brightness_percent > $brightness_path"
exit 0
fi

echo -e "Wrong number of arguments!\n\n\
Usage: script [0.0... - 1.0...]"
exit 1
# print error if $1 is greater than max_brightness
# print error if $# is not exactly 1
# add -h and --help flag
