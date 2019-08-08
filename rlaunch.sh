#!/bin/bash

if [[ ! -v SELECTED_DEVICE ]]; then
    source _adb/_selector.sh

    selectDevice SELECTED_DEVICE

    if [[ "$SELECTED_DEVICE" = "0" ]]; then
        echo "Please select a valid device"
        exit 0;
    fi
fi

ANDROID_HOME=$(xmlstarlet sel -t -v '/config/ANDROID_HOME' config.xml)

dirs=($(ls -d smali_* 2> /dev/null | sort -r))
if [[ -n "$dirs" ]]; then
    dir=${dirs[0]}
    package=$(xmlstarlet sel -t -v "/manifest/@package" ${dir}/AndroidManifest.xml)
    ${ANDROID_HOME}/platform-tools/adb -s ${SELECTED_DEVICE} shell monkey -p ${package} 1
fi