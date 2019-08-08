#!/bin/bash

source _adb/adbwrapper-func.sh

bash bsmali.sh
bash rsign.sh

selectDevice SELECTED_DEVICE

if [[ "$SELECTED_DEVICE" = "0" ]]; then
  echo "Please select a valid device"
  exit 0;
fi

bash rinstall.sh
bash rlaunch.sh
