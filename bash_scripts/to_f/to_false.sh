#!/bin/bash

# delete header
#   read first X lines, determine if there are exactly 6 fields $NF
#   discard until we get to the first line with exactly 6 fields
#   at the first two lines with exactly 6 fields, discard
#   at the 3rd and 4th lines, change the fields 4-6 to be FALSE 
#   REPEAT ABOVE TWO TIL EOF

# TODO: change to allow for processing unlimited files, put into sep dir
my_file="$1"

first_ln=$(awk 'NF == 6 { print NR; exit; }' "$my_file")

# TESTING 123
# echo "$first_ln"

awk -v start="$first_ln" '
BEGIN {OFS = "\t"; offset1 = 2; offset2 = 3} 
{print(NR == start + offset1 || NR == start + offset2 ? $1 $2 $3 "F F F" : $0); if(NR == start + offset1) offset1 += 4; if(NR == start + offset2) offset2 += 4};
' "$my_file"
