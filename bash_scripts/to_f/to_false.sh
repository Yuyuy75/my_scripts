#!/bin/bash

#   This program takes disregards the header (any lines
#+  at the start of the program that do not have 6 fields)
#+  and changes the last 3 fields of every 3rd and 4th lines 
#+  to F until the end of the file.


# TODO: change to allow for processing unlimited files, put into sep dir
my_file="$1"

first_ln=$(awk 'NF == 6 { print NR; exit; }' "$my_file")

# TESTING 123
# echo "$first_ln"

awk -v start="$first_ln" '
BEGIN {OFS = "\t"; offset1 = 2; offset2 = 3; F = "F"} 
{print NR == start + offset1 || NR == start + offset2 ? $1 " " $2 " " $3 " " F " " F " " F : $0; if(NR == start + offset1) offset1 += 4; if(NR == start + offset2) offset2 += 4};
' "$my_file"
