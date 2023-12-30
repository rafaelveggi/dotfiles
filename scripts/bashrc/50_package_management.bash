#!/usr/bin/env bash

case $(uname) in
FreeBSD)
  pki() { pkg install "$@"; }
  pku() { pkg update "$@"; }
  pks() { pkg search "$@"; }
  pkr() { pkg remove "$@"; }
  ;;
Void)
  pki() { sudo xbps-install --sync --yes "$@"; }
  pku() { sudo xbps-install --sync --update "$@"; }
  pks() { xbps-query --regex --repository --search "$@"; }
  pkr() { sudo xbps-remove --clean-cache --remove-orphans "$@"; }
  pkg-update() {
    dir=$(pwd)
    pkg="${1:-google-chrome}"
    cd ~/void-packages || exit
    git pull
    ./xbps-src pkg "$pkg"
    sudo xbps-install --repository hostdir/binpkgs/nonfree "$pkg"
    cd "$dir" || exit
  }
  ;;
esac
