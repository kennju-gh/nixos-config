#!/usr/bin/env bash

VPNS=("TR1")

if [ "$1" = "--status" ]; then
    if nmcli -t -f NAME,TYPE connection show --active | grep -q ":wireguard$"; then
        echo '{"text": "ON", "class": "activated"}'
    else
        echo '{"text": "OFF", "class": "deactivated"}'
    fi
    exit 0
fi

CURRENT_VPN=$(nmcli -t -f NAME,TYPE connection show --active | grep ":wireguard$" | cut -d: -f1 || true)

if [ -n "$CURRENT_VPN" ]; then
    nmcli connection down "$CURRENT_VPN"
else
    nmcli connection up "${VPNS[0]}"
fi

pkill -SIGRTMIN+9 waybar
