#!/bin/bash

if [[ "$1" == '-h' ]] || [[ "$1" == '--help' ]]; then
    echo "Usage: `basename $0` [optional args]"
    exit 0
fi

jadx_version=$(xmlstarlet sel -t -v '/config/jadx_version' config.xml)

for arg in "$@" ; do
    case $arg in
        -j|-r|-s|-e|-v)
            args+=("$arg")
            ;;
        *)
            ;;
    esac
done

IFS=$'\n'
for apk in $(ls *.apk 2> /dev/null | sort); do
    dir=jadx_$(date '+%Y%m%d_%H%M%S')_$(echo "${apk}" | sed -r 's/([^a-zA-Z0-9]+|.apk$)//g')
    _jadx-${jadx_version}/bin/jadx "${apk}" -d ${dir} ${args[@]}
    sleep 1
done