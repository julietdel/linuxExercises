#!/bin/bash

cat Property_Tax_Roll.csv \
| grep "MADISON SCHOOLS" \
| cut -d, -f7 \
| {
    sum=0
    n=0

    while read -r value
    do
        sum=$(awk -v s="$sum" -v v="$value" 'BEGIN { print s + v }')
        n=$((n + 1))
    done

    awk -v s="$sum" -v n="$n" 'BEGIN { print s / n }'
}
	
