#!/bin/bash

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "Usage: `basename $0` [optional args]"
    exit 0
fi

apktool_version=$(jq -r '.apktool_version' config.json)
jadx_version=$(jq -r '.jadx_version' config.json)

IFS=$'\n'

mkdir -p original
for apk in $(ls *.apk 2> /dev/null); do
    dir=smali_$(echo "${apk}" | sed -r 's/[^a-zA-Z0-9]+//g')_$(date '+%Y%m%d_%H%M%S')
    java -jar libs/apktool_${apktool_version}.jar d "${apk}" -o ${dir} $@
    jadx-${jadx_version}/bin/jadx -d out classes.dex
    sleep 1
    #mv "${apk}" "original/$apk"
done