#!/bin/bash

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "Usage: `basename $0` [optional args]"
    exit 0
fi

jadx_version=$(jq -r '.jadx_version' config.json)

IFS=$'\n'

for apk in $(ls *.apk 2> /dev/null); do
    dir=jadx_$(echo "${apk}" | sed -r 's/[^a-zA-Z0-9]+//g')_$(date '+%Y%m%d_%H%M%S')
    jadx-${jadx_version}/bin/jadx "${apk}" $@ -d ${dir}
    sleep 1
done