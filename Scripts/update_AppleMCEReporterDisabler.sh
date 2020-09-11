#!/bin/bash

# Debug
set -x

# Create tmp dir
mkdir -p ./.tmp

OC_DIR=../EFI/OC
TMP_DST=./.tmp/AppleMCEReporterDisabler.zip
EXTRACT_DST=./.tmp/AppleMCEReporterDisabler

curl -sL https://github.com/acidanthera/bugtracker/files/3703498/AppleMCEReporterDisabler.kext.zip -o $TMP_DST
unzip -qo $TMP_DST -d $EXTRACT_DST

cp -rp $EXTRACT_DST/AppleMCEReporterDisabler.kext $OC_DIR/Kexts/
