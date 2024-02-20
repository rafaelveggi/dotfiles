#!/usr/bin/env bash

if [ -n "$DISPLAY" ]; then
    xrandr --output HDMI-A-0 --pos 0x160 --primary \
    --output HDMI-A-1 --pos 2560x0 --rotate right \
    --output DisplayPort-0 --pos 720x1240 --auto
fi
