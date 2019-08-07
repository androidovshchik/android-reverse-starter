#!/bin/bash

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "Usage: `basename $0` [optional args]"
    exit 0
fi

apktool_version=$(jq -r '.apktool_version' config.json)

IFS=$'\n'

mkdir -p original
for apk in $(ls *.apk 2> /dev/null); do
    dir=smali_$(echo "${apk}" | sed -r 's/[^a-zA-Z0-9]+//g')_$(date '+%d%m%Y_%H%M%S')
    java -jar libs/apktool_${apktool_version}.jar d "${apk}" -o ${dir} $@
    #mv "${apk}" "original/$apk"
done