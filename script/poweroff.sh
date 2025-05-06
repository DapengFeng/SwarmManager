#!/bin/bash
# This script is used to power off multiple remote machines
# Usage: ./script/poweroff.sh password

password=$1
username=$(yq e '.username' config/config.yaml)
IP=$(yq e '.ip[]' config/config.yaml)

if [ -z "$password" ]; then
    echo "Usage: $0 <password>"
    exit 1
fi

if [ -z "$username" ]; then
    echo "Username not found in config/config.yaml"
    exit 1
fi

if [ -z "$IP" ]; then
    echo "No IP addresses found in config/config.yaml"
    exit 1
fi

for ip in ${IP[@]}; do
    ssh $username@$ip "echo ${password} | sudo -S poweroff"
done
