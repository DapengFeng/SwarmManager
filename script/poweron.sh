#!/bin/bash
# This script is used to power on multiple remote machines using Wake-on-LAN
# Usage: ./script/poweron.sh

MAC=$(yq e '.mac[]' config/config.yaml)

if [ -z "$MAC" ]; then
    echo "No MAC addresses found in config/config.yaml"
    exit 1
fi

for mac in ${MAC[@]}; do
    wakeonlan ${mac}
done
