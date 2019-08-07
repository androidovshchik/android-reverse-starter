#!/bin/bash

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "Usage: `basename $0` [optional args]"
    exit 0
fi

apktool_version=$(jq -r '.apktool_version' config.json)

IFS=$'\n'

for apk in $(ls *.apk 2> /dev/null); do
    dir=smali_$(date '+%Y%m%d_%H%M%S')_$(echo "${apk}" | sed -r 's/([^a-zA-Z0-9]+|.apk$)//g')
    java -jar _libs/apktool_${apktool_version}.jar d "${apk}" $@ -o ${dir} | grep -vE "S: "
    sleep 1
done