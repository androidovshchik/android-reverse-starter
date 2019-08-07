#!/bin/bash

uber_apk_signer_version="1.0.0"
apktool_version="2.4.0"

rm -rf libs
mkdir -p libs
wget https://github.com/patrickfav/uber-apk-signer/releases/download/v${uber_apk_signer_version}/uber-apk-signer-${uber_apk_signer_version}.jar -O libs/uber-apk-signer-${uber_apk_signer_version}.jar
wget https://github.com/iBotPeaches/Apktool/releases/download/v${apktool_version}/apktool_${apktool_version}.jar -O libs/apktool_${apktool_version}.jar