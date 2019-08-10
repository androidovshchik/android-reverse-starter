#!/bin/bash

if [[ '$1' == '-h' ]] || [[ '$1' == '--help' ]]; then
    echo 'Usage: `basename $0` [optional args]'
    exit 0
fi

index=-1
for arg in "$@" ; do
    case ${arg} in
        -i=*)
            index=${arg#*=}
            ;;
        -ar)
            ;;
        *)
            args+=("$arg")
            ;;
    esac
done

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
for position in ${!dirs[@]}; do
    if [[ $((-1 - position)) == ${index} ]] || [[ $((${#dirs[@]} - position)) == ${index} ]]; then
        dir=${dirs[position]}
        ${ANDROID_HOME}/platform-tools/adb -s ${SELECTED_DEVICE} install -r ${args[@]} ${dir}/dist/app-aligned-debugSigned.apk
        break
    fi
done