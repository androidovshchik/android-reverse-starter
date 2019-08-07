#!/bin/bash

uber_apk_signer_version=$(jq -r '.uber_apk_signer_version' config.json)
apktool_version=$(jq -r '.apktool_version' config.json)
jadx_version=$(jq -r '.jadx_version' config.json)

rm -rf _libs
mkdir -p _libs
wget https://github.com/patrickfav/uber-apk-signer/releases/download/v${uber_apk_signer_version}/uber-apk-signer-${uber_apk_signer_version}.jar -O _libs/uber-apk-signer-${uber_apk_signer_version}.jar
wget https://github.com/iBotPeaches/Apktool/releases/download/v${apktool_version}/apktool_${apktool_version}.jar -O _libs/apktool_${apktool_version}.jar

rm -rf _jadx*
mkdir -p _jadx-${jadx_version}
wget https://github.com/skylot/jadx/releases/download/v${jadx_version}/jadx-${jadx_version}.zip
unzip jadx-${jadx_version}.zip -d _jadx-${jadx_version}
rm jadx-${jadx_version}.zip