#!/bin/bash

if [[ '$1' == '-h' ]] || [[ '$1' == '--help' ]]; then
    echo 'Usage: `basename $0` [optional args]'
    exit 0
fi

for arg in "$@" ; do
    if [[ ${arg} == "-ds" ]]; then
        bash dsmali.sh $@
        break
    fi
done
for arg in "$@" ; do
    if [[ ${arg} == "-dj" ]]; then
        bash djadx.sh $@
        break
    fi
done

IFS=$'\n'
mkdir -p _original
for apk in $(ls *.apk 2> /dev/null); do
    mv "$apk" "_original/$apk"
done