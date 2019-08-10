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
    esac
done

apktool_version=$(xmlstarlet sel -t -v '/config/apktool_version' config.xml)

dirs=($(ls -d smali_* 2> /dev/null | sort -r))
for position in ${!dirs[@]}; do
    if [[ $((-1 - position)) == ${index} ]] || [[ $((${#dirs[@]} - position)) == ${index} ]]; then
        dir=${dirs[position]}
        rm -rf ${dir}/dist
        java -jar _libs/apktool_${apktool_version}.jar b $@ ${dir} -o ${dir}/dist/app.apk
        break
    fi
done