#!/bin/bash

if [ ! $# -eq 2 ]; then
    echo "Usage: writer.sh /valid/file/name text-to-write"
    exit 1
fi

fullpath="${1}"
writestr="${2}"

dirname=`dirname "${1}"`
filename=`basename "${1}"`

mkdir -p "${dirname}"
if [ $? -gt 0 ]; then
    echo "ERROR: could not create path"
    exit 1
fi

echo "${2}" > "${dirname}/${filename}"
if [ $? -gt 0 ]; then
    echo "ERROR: could not create file"
    exit 1
fi
