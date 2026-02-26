#!/bin/bash
# make main directory
mkdir -p five

# loop for dir1 to dir5
for i in {1..5}
do
  mkdir -p five/dir$i

  # loop for file1 to file4
  for j in {1..4}
  do
    file="five/dir$i/file$j"

    # clear file first (important if rerunning script)
    > "$file"

    # write j lines of number j
    for k in $(seq 1 $j)
    do
      echo "$j" >> "$file"
    done
  done
done 
