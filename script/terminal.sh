#!/bin/bash
# This script is used to open a terminal on multiple remote machines and run a command
# Usage: .script/terminal.sh cmd

cmd="$*"
username=$(yq e '.username' config/config.yaml)
IP=$(yq e '.ip[]' config/config.yaml)

if [ -z "$cmd" ]; then
    echo "Usage: $0 <command to execute on remote machines>"
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
    ssh $username@$ip "export DISPLAY=:0; gnome-terminal -- bash -i -c \"${cmd}; exec bash\"" 
done
