#!/bin/bash

# Debug
set -x

# Create tmp dir
mkdir -p ./.tmp

OC_DIR=../EFI/OC

TMP_DST=./.tmp/SSDT-PLUG-DRTNIA.aml
curl -sL https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-PLUG-DRTNIA.aml?raw=true -o $TMP_DST
cp -p $TMP_DST $OC_DIR/ACPI/

TMP_DST=./.tmp/SSDT-EC-USBX-DESKTOP.aml
curl -sL https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-EC-USBX-DESKTOP.aml?raw=true -o $TMP_DST
cp -p $TMP_DST $OC_DIR/ACPI/

TMP_DST=./.tmp/SSDT-AWAC.aml
curl -sL https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-AWAC.aml?raw=true -o $TMP_DST
cp -p $TMP_DST $OC_DIR/ACPI/
