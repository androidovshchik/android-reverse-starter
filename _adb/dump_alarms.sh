#!/bin/bash

# This script will dump all activities running on a device

# Include the shell script that contains the function to select a device
source _selector.sh

# Get the device to use for this command
selectDevice SELECTED_DEVICE

# Make sure the user selected a device
if [[ "$SELECTED_DEVICE" = "0" ]]; then
  echo "Please select a valid device"
  exit 0;
fi

# Dump all the alarms on the device
adb -s ${SELECTED_DEVICE} shell dumpsys alarm

