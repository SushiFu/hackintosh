#!/bin/bash

# Debug
set -x

# Create tmp dir
mkdir -p ./.tmp

OC_DIR=../EFI/OC
TMP_DST=./.tmp/SMCAMDProcessor.zip
EXTRACT_DST=./.tmp/SMCAMDProcessor

DL_URL=$(curl -s "https://api.github.com/repos/trulyspinach/SMCAMDProcessor/releases" |
  grep "browser_download_url.*AMDRyzenCPUPowerManagement.kext.zip" | head -n 1 |
  cut -d : -f 2,3 | tr -d \" | tr -d " ")
curl -sL $DL_URL -o $TMP_DST
unzip -qo $TMP_DST -d $EXTRACT_DST

DL_URL=$(curl -s "https://api.github.com/repos/trulyspinach/SMCAMDProcessor/releases" |
  grep "browser_download_url.*SMCAMDProcessor.kext.zip" | head -n 1 |
  cut -d : -f 2,3 | tr -d \" | tr -d " ")
curl -sL $DL_URL -o $TMP_DST
unzip -qo $TMP_DST -d $EXTRACT_DST

cp -rp $EXTRACT_DST/*.kext $OC_DIR/Kexts/
