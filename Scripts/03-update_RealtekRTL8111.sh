#!/bin/bash

# Debug
set -x

# Create tmp dir
mkdir -p ./.tmp

OC_DIR=../EFI/OC
TMP_DST=./.tmp/RealtekRTL8111.zip
EXTRACT_DST=./.tmp/RealtekRTL8111

DL_URL=$(curl -s "https://api.github.com/repos/Mieze/RTL8111_driver_for_OS_X/releases/latest" |
  grep "browser_download_url.*.zip" | cut -d : -f 2,3 |
  tr -d \" | tr -d " ")

curl -sL $DL_URL -o $TMP_DST
unzip -qo $TMP_DST -d $EXTRACT_DST

cp -rp $EXTRACT_DST/RealtekRTL8111-V*/Release/RealtekRTL8111.kext $OC_DIR/Kexts/
