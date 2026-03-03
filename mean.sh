#!/bin/bash
usage() {
    echo "usage: ./mean.sh <column> [file.csv]" >&2
    exit 1
}

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    usage
fi

col="$1"

case "$col" in
    ''|*[!0-9]*)
        usage
        ;;
esac

if [ $# -eq 2 ]; then
    file="$2"
else
    file="/dev/stdin"
fi

cut -d',' -f"$col" "$file" | tail -n +2 | \
awk '{ sum += $1; n++ } END { if (n>0) print sum/n; else print 0 }'
