#!/bin/bash

if [[ '$1' == '-h' ]] || [[ '$1' == '--help' ]]; then
    echo 'Usage: `basename $0` [optional args]'
    exit 0
fi

uber_apk_signer_version=$(jq -r '.uber_apk_signer_version' config.json)

dirs=($(ls -d smali_* 2> /dev/null | sort -r))
if [[ -n "$dirs" ]]; then
    dir=${dirs[0]}
    java -jar _libs/uber-apk-signer-${uber_apk_signer_version}.jar -a ${dir}/dist --out ${dir}/dist
fi