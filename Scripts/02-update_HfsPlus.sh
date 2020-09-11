#!/bin/bash

# Debug
set -x

# Create tmp dir
mkdir -p ./.tmp

OC_DIR=../EFI/OC
TMP_DST=./.tmp/HfsPlus.efi

curl -sL https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi?raw=true -o $TMP_DST
cp -p $TMP_DST $OC_DIR/Drivers/
