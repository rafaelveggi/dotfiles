#!/usr/bin/bash

if [ -n "$DISPLAY" ]; then
  setxkbmap -layout us -variant altgr-intl -option caps:escape
fi
