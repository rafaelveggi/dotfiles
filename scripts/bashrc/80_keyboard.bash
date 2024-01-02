#!/usr/bin/env bash

if [ -n "$DISPLAY" ]; then
  # @TODO check if file exists and place it. FreeBSD: /usr/share/syscons/keymaps/
  setxkbmap -layout us -variant altgr-intl -option caps:escape
else
  : # sudo loadkeys raf-keymap
fi
