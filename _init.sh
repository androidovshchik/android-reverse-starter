#!/bin/bash

uber_apk_signer_version=$(xmlstarlet sel -t -v '/config/uber_apk_signer_version' config.xml)
apktool_version=$(xmlstarlet sel -t -v '/config/apktool_version' config.xml)
jadx_version=$(xmlstarlet sel -t -v '/config/jadx_version' config.xml)

rm -rf _libs
rm -rf _jadx*

mkdir -p _libs
mkdir -p _jadx-${jadx_version}

wget https://github.com/patrickfav/uber-apk-signer/releases/download/v${uber_apk_signer_version}/uber-apk-signer-${uber_apk_signer_version}.jar -O _libs/uber-apk-signer-${uber_apk_signer_version}.jar
wget https://github.com/iBotPeaches/Apktool/releases/download/v${apktool_version}/apktool_${apktool_version}.jar -O _libs/apktool_${apktool_version}.jar

wget https://github.com/skylot/jadx/releases/download/v${jadx_version}/jadx-${jadx_version}.zip
unzip jadx-${jadx_version}.zip -d _jadx-${jadx_version}
rm jadx-${jadx_version}.zip

wget https://raw.githubusercontent.com/L-JINBIN/ApkSignatureKiller/master/nkstool.jar -O _libs/nkstool.jar