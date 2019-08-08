#!/bin/bash

if [[ '$1' == '-h' ]] || [[ '$1' == '--help' ]]; then
    echo 'Usage: `basename $0` [optional args]'
    exit 0
fi

ANDROID_HOME=$(xmlstarlet sel -t -v '/config/ANDROID_HOME' config.xml)

dirs=($(ls -d smali_* 2> /dev/null | sort -r))
if [[ -n "$dirs" ]]; then
    dir=${dirs[0]}
    activity=''
    for line in $(xmlstarlet sel -t -c "/manifest/application/activity" ${dir}/AndroidManifest.xml); do
        if [[ ${line} =~ android:name=\".+\" ]]; then
            if [[ ${line} =~ android:name=\"android.intent.action.MAIN\" ]]; then
                echo ${line}
            fi
        fi
    done
    package=$(xmlstarlet sel -t -v "/manifest/@package" ${dir}/AndroidManifest.xml)
    ${ANDROID_HOME}/platform-tools/adb shell am start -n ${package}/${activity}
fi