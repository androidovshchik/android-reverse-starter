#!/bin/bash

if [[ '$1' == '-h' ]] || [[ '$1' == '--help' ]]; then
    echo 'Usage: `basename $0` [optional args]'
    exit 0
fi

ANDROID_HOME=$(xmlstarlet sel -t -v '/config/ANDROID_HOME' config.xml)

dirs=($(ls -d smali_* 2> /dev/null | sort -r))
if [[ -n "$dirs" ]]; then
    dir=${dirs[0]}
    ${ANDROID_HOME}/platform-tools/adb install -r ${dir}/dist/app-aligned-debugSigned.apk
fi