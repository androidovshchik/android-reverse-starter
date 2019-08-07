#!/bin/bash

bash dsmali.sh
bash djadx.sh

IFS=$'\n'
mkdir -p _original
for apk in $(ls *.apk 2> /dev/null); do
    mv "${apk}" "_original/${apk}"
done