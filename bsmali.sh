#!/bin/bash

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "Usage: `basename $0` [optional args]"
    exit 0
fi

apktool_version=$(jq -r '.apktool_version' config.json)

dirs=($(ls -d smali_* 2> /dev/null | sort -r))
if [[ -n "$dirs" ]]; then
    dir=${dirs[0]}
    java -jar _libs/apktool_${apktool_version}.jar b ${dir} $@
fi