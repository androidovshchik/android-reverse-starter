#!/bin/bash

ANDROID_HOME=$(xmlstarlet sel -t -v '/config/ANDROID_HOME' config.xml)

dirs=($(ls -d smali_* 2> /dev/null | sort -r))
if [[ -n "$dirs" ]]; then
    dir=${dirs[0]}
    package=$(xmlstarlet sel -t -v "/manifest/@package" ${dir}/AndroidManifest.xml)
    ${ANDROID_HOME}/platform-tools/adb shell monkey -p ${package} 1
fi