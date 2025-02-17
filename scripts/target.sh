#!/bin/bash

TARGET_HOSTNAME_VAR=""
TARGET_IP_VAR="0.0.0.0"

if [[ -n "${TARGET_HOSTNAME_VAR}" && -n "${TARGET_IP_VAR}" ]]; then
    if grep -q "$TARGET_HOSTNAME_VAR" /etc/hosts; then
        sudo sed -i "s/.*$TARGET_HOSTNAME_VAR/$TARGET_IP_VAR $TARGET_HOSTNAME_VAR/" /etc/hosts
    else
        echo "$TARGET_IP_VAR $TARGET_HOSTNAME_VAR" | sudo tee -a /etc/hosts > /dev/null
    fi
fi

export TARGET_HOSTNAME=$TARGET_HOSTNAME_VAR
export TARGET_IP=$TARGET_IP_VAR
