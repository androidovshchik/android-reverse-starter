#!/bin/bash

if [[ '$1' == '-h' ]] || [[ '$1' == '--help' ]]; then
    echo 'Usage: `basename $0` [optional args]'
    exit 0
fi

apktool_version=$(xmlstarlet sel -t -v '/config/apktool_version' config.xml)

dirs=($(ls -d smali_* 2> /dev/null | sort -r))
if [[ -n "$dirs" ]]; then
    dir=${dirs[0]}
    rm -rf ${dir}/dist
    java -jar _libs/apktool_${apktool_version}.jar b $@ ${dir} -o ${dir}/dist/app.apk 2>&1 | grep 'I:'
fi