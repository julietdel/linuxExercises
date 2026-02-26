#!/bin/bash

# check number of arguments
if [ "$#" -ne 2 ]; then
    echo "usage: $0 <dir> <n>" 1>&2
    exit 1
fi

dir="$1"
n="$2"

# check if directory exists
if [ ! -d "$dir" ]; then
    echo "Error: '$dir' is not a directory" 1>&2
    exit 1
fi

# find and remove files larger than n bytes
find "$dir" -type f -size +"$n"c -exec rm {} \;
