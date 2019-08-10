#!/bin/bash

if [[ '$1' == '-h' ]] || [[ '$1' == '--help' ]]; then
    echo 'Usage: `basename $0` [optional args]'
    exit 0
fi

bash bsmali.sh $@
bash rsign.sh $@

for arg in "$@" ; do
    if [[ ${arg} == "-ar" ]]; then
        bash _adb/restart.sh
        break
    fi
done

source _adb/_selector.sh

selectDevice SELECTED_DEVICE

if [[ "$SELECTED_DEVICE" = "0" ]]; then
  echo "Please select a valid device"
  exit 0;
fi

bash rinstall.sh $@
bash rlaunch.sh $@
