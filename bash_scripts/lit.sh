#!/bin/bash
#   this script changes screen brightness
#+  works for ubuntu 18.04 with an intel video card
#+  no guarantees for anything else! :p

brightness_path='/sys/class/backlight/intel_backlight/brightness'
brightness=$(cat "/sys/class/backlight/intel_backlight/max_brightness")
max_brightness=$brightness


if [ $# -eq 1 ]
    then
    brightness_percent=$( echo "scale=0; ($1 % 100 * $max_brightness)/1" | bc )
    #if [ $1 -gt 1 ]
if [ awk -v bright_val = "$1" BEGIN {printf "$bright_val" > 1 ? "1" : "0"} ]
        then
        echo -e "Brightness value too high!\n\
Enter a number in the range [0.0... - 1.0...]"
        exit 2
    fi
    if [ awk -v bright_val = "$1" BEGIN {printf "$bright_val" < 1 ? "1" : "0"} ]
        then
        echo -e "Brightness value too low!\n\
Enter a number in the range [0.0... - 1.0...]"
        exit 2
    fi
    #echo $brightness_percent; for testing!
    sudo sh -c "echo $brightness_percent > $brightness_path"
exit 0
fi

echo -e "Wrong number of arguments!\n\n\
Usage: script [0.0... - 1.0...]\n
Example: script .5"
exit 1

# print error if $1 is greater than max_brightness DONE
# print error if $# is not exactly 1 DONE
# add -h and --help flag
# fix error in which integer expression is expected..
