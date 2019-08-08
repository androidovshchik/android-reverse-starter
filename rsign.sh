#!/bin/bash

if [[ '$1' == '-h' ]] || [[ '$1' == '--help' ]]; then
    echo 'Usage: `basename $0` [optional args]'
    exit 0
fi

uber_apk_signer_version=$(xmlstarlet sel -t -v '/config/uber_apk_signer_version' config.xml)

dirs=($(ls -d smali_* 2> /dev/null | sort -r))
if [[ -n "$dirs" ]]; then
    dir=${dirs[0]}
    java -jar _libs/uber-apk-signer-${uber_apk_signer_version}.jar -a ${dir}/dist/app.apk $@ | grep -vE "^(\s|$)"
fi