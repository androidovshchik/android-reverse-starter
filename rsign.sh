#!/bin/bash

if [[ "$1" == '-h' ]] || [[ "$1" == '--help' ]]; then
    echo "Usage: `basename $0` [optional args]"
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

uber_apk_signer_version=$(xmlstarlet sel -t -v '/config/uber_apk_signer_version' config.xml)

dirs=($(ls -d smali_* 2> /dev/null | sort -r))
for position in ${!dirs[@]}; do
    if [[ $((-1 - position)) == ${index} ]] || [[ $((${#dirs[@]} - position)) == ${index} ]]; then
        dir=${dirs[position]}
        java -jar _libs/uber-apk-signer-${uber_apk_signer_version}.jar -a ${dir}/dist/app.apk ${args[@]} | grep -vE "^(\s|$)"
        break
    fi
done