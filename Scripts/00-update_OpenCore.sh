#!/bin/bash

# Debug
set -x

# Create tmp dir
mkdir -p ./.tmp

OC_DIR=../EFI/OC
TMP_DST=./.tmp/OC-Release.zip
EXTRACT_DST=./.tmp/OC-Release

DL_URL=$(curl -s "https://api.github.com/repos/acidanthera/OpenCorePkg/releases/latest" |
  grep "browser_download_url.*-RELEASE.zip" | cut -d : -f 2,3 |
  tr -d \" | tr -d " ")

curl -sL $DL_URL -o $TMP_DST
unzip -qo $TMP_DST -d $EXTRACT_DST

cp -p $EXTRACT_DST/X64/EFI/BOOT/BOOTx64.efi ../EFI/BOOT/

cp -p $EXTRACT_DST/X64/EFI/OC/OpenCore.efi $OC_DIR/

cp -p $EXTRACT_DST/X64/EFI/OC/Bootstrap/Bootstrap.efi $OC_DIR/Bootstrap/

cp -p $EXTRACT_DST/X64/EFI/OC/Drivers/OpenRuntime.efi $OC_DIR/Drivers/

cp -pr $EXTRACT_DST/X64/EFI/OC/Resources $OC_DIR/Resources

cp -p $EXTRACT_DST/X64/EFI/OC/Tools/OpenShell.efi $OC_DIR/Tools/
cp -p $EXTRACT_DST/X64/EFI/OC/Tools/ResetSystem.efi $OC_DIR/Tools/
