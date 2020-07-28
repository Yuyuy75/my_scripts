#!/bin/bash

# delete header
#   read first X lines, determine if there are exactly 6 fields $NF
#   discard until we get to the first line with exactly 6 fields
#   at the first two lines with exactly 6 fields, discard
#   at the 3rd and 4th lines, change the fields 4-6 to be FALSE 
#   REPEAT ABOVE TWO TIL EOF

# TODO: change to allow for processing unlimited files, put into sep dir
my_file="$1"

awk '{ print(NF == 6 ? $1 "\t" $2 "\t" $3 "\t" "F F F" : $0) }' "$my_file"
