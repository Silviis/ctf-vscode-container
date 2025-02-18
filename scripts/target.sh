#!/bin/bash

TARGET_HOSTNAME_VAR="Chemistry"
TARGET_IP_VAR="10.10.11.38"

export TARGET_HOSTNAME=$TARGET_HOSTNAME_VAR
export TARGET_IP=$TARGET_IP_VAR

if [[ -n "${TARGET_HOSTNAME_VAR}" && -n "${TARGET_IP_VAR}" ]]; then
    if ! grep -q "$TARGET_HOSTNAME_VAR" /etc/hosts; then
        echo "$TARGET_IP_VAR $TARGET_HOSTNAME_VAR" | sudo tee -a /etc/hosts > /dev/null
    fi
    # Comment the rest if not using htb
    TARGET_HOSTNAME_VAR_HTB="${TARGET_HOSTNAME_VAR}.htb"
    export TARGET_HOSTNAME_HTB=$TARGET_HOSTNAME_VAR_HTB
    if ! grep -q "$TARGET_HOSTNAME_VAR_HTB" /etc/hosts; then
        echo "$TARGET_IP_VAR $TARGET_HOSTNAME_VAR_HTB" | sudo tee -a /etc/hosts > /dev/null
    fi
fi
