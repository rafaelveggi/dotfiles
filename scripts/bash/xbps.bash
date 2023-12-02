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

updt() {
  ### TBD
  local to_update with_info
  to_update="$(
    xbps-install -Mun |
      awk '{print $1}' |
      awk '{printf "%s%s", (NR==1)?"(":"|", $0}; END{print ")"}'
  )"

  with_info="$(xbps-query --repository --regex --search "$to_update" | cut -d' ' -f2- )"
  echo "$with_info"

}
