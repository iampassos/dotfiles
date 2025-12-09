#!/bin/sh

if lsof /dev/video0 >/dev/null 2>&1; then
    echo "󰄀 "
fi
