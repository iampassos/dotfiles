#!/bin/sh

if lsof /dev/video0 >/dev/null 2>&1; then
    camera="󰄀"
fi

if pactl list sources | grep -i "RUNNING" >/dev/null 2>&1; then
    mic=""
fi

echo "$camera $mic"
