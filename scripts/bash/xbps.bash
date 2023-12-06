#!/bin/bash

alias inst="sudo xbps-install --sync --yes "
alias update="sudo xbps-install --sync --update "
alias remove="sudo xbps-remove --clean-cache --remove-orphans "
alias search="xbps-query --regex --repository --search "

pkg-update() {
  dir=$(pwd)
  pkg="${1:-google-chrome}"
  cd ~/void-packages || exit
  git pull
  ./xbps-src pkg "$pkg"
  sudo xbps-install --repository hostdir/binpkgs/nonfree "$pkg"
  cd "$dir" || exit
}
