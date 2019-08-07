#!/bin/bash

uber_apk_signer_version=$(jq -r '.uber_apk_signer_version' config.json)
apktool_version=$(jq -r '.apktool_version' config.json)

rm -rf libs
mkdir -p libs
wget https://github.com/patrickfav/uber-apk-signer/releases/download/v${uber_apk_signer_version}/uber-apk-signer-${uber_apk_signer_version}.jar -O libs/uber-apk-signer-${uber_apk_signer_version}.jar
wget https://github.com/iBotPeaches/Apktool/releases/download/v${apktool_version}/apktool_${apktool_version}.jar -O libs/apktool_${apktool_version}.jar