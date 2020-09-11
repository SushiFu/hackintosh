#!/bin/bash

# Debug
set -x

# Create tmp dir
mkdir -p ./.tmp

OC_DIR=../EFI/OC
TMP_DST=./.tmp/VirtualSMC.zip
EXTRACT_DST=./.tmp/VirtualSMC

DL_URL=$(curl -s "https://api.github.com/repos/acidanthera/VirtualSMC/releases/latest" |
  grep "browser_download_url.*-RELEASE.zip" | cut -d : -f 2,3 |
  tr -d \" | tr -d " ")

curl -sL $DL_URL -o $TMP_DST
unzip -qo $TMP_DST -d $EXTRACT_DST

cp -rp $EXTRACT_DST/Kexts/VirtualSMC.kext $OC_DIR/Kexts/
