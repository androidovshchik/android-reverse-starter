#!/bin/bash

if [[ "$1" == '-h' ]] || [[ "$1" == '--help' ]]; then
    echo "Usage: `basename $0`"
    exit 0
fi

sed -i "s|~|$HOME|g" config.txt

IFS=$'\n'
for apk in $(ls *.apk 2> /dev/null); do
    if [ "$apk" != "src.apk" ]; then
        mv "$apk" src.apk
    fi
done

java -jar _libs/nkstool.jar

mkdir -p _original
for apk in $(ls *.apk 2> /dev/null); do
    if [ "$apk" != "out.apk" ]; then
        mv "$apk" "_original/$apk"
    fi
done