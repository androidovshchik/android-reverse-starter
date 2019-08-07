#!/bin/bash

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "Usage: `basename $0` [path/to/apk] [optional args]"
    exit 0
fi

java -jar libs/apktool_1.0.0.jar d