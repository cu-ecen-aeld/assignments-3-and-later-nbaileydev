#!/bin/bash

if [ ! $# -eq 2 ]; then
    echo "Usage: finder.sh /existing/folder/name search-string"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
    echo "ERROR: The folder (argument 1) does not exist."
    exit 1
fi

files=0
lines=0

for f in `find ${filesdir} -type f`; do
    ((files++))
    ((lines += `grep -c "${searchstr}" $f` ))
done

echo "The number of files are ${files} and the number of matching lines are ${lines}"