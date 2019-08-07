#!/bin/bash

uber_apk_signer_version=$(jq -r '.uber_apk_signer_version' config.json)
apktool_version=$(jq -r '.apktool_version' config.json)
jadx_version=$(jq -r '.jadx_version' config.json)

rm -rf libs
mkdir -p libs
wget https://github.com/patrickfav/uber-apk-signer/releases/download/v${uber_apk_signer_version}/uber-apk-signer-${uber_apk_signer_version}.jar -O libs/uber-apk-signer-${uber_apk_signer_version}.jar
wget https://github.com/iBotPeaches/Apktool/releases/download/v${apktool_version}/apktool_${apktool_version}.jar -O libs/apktool_${apktool_version}.jar

rm -rf jadx*
mkdir -p jadx-${jadx_version}
wget https://github.com/skylot/jadx/releases/download/v${jadx_version}/jadx-${jadx_version}.zip
unzip jadx-${jadx_version}.zip -d jadx-${jadx_version}
rm jadx-${jadx_version}.zip