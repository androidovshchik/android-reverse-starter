#!/bin/bash

for arg in "$@" ; do
    if [[ ${arg} == "-ds" ]]; then
        bash dsmali.sh
        break
    fi
done
for arg in "$@" ; do
    if [[ ${arg} == "-dj" ]]; then
        bash djadx.sh
        break
    fi
done

IFS=$'\n'
mkdir -p _original
for apk in $(ls *.apk 2> /dev/null); do
    mv "${apk}" _original/${apk}
done