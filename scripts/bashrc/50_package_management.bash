#!/usr/bin/env bash

function freebsd() {
	function pki() { sudo pkg install "$@"; }
	function pku() { sudo pkg update; }
#	function pks() { pkg search "$@"; }
	function pkr() { sudo pkg remove "$@"; }
	function pks() {
		local results is_installed pkg_name
		
		results=$(pkg search "$@")
		if [ -z "$results" ]; then 
			return;
		fi

		echo "$results" | while read -r line; do 
			pkg_name=$(echo "$line" | awk '{print $1}')
			if pkg info -e "$pkg_name" > /dev/null 2>&1; then
				echo "[*] $line"
			else
				echo "[-] $line"
			fi
		done
	}
}

function voidlinux() {
	function pki() { sudo xbps-install --sync --yes "$@"; }
	function pku() { sudo xbps-install --sync --update "$@"; }
	function pks() { xbps-query --regex --repository --search "$@"; }
	function pkr() { sudo xbps-remove --clean-cache --remove-orphans "$@"; }
	function pkg-update() {
	  dir=$(pwd)
	  pkg="${1:-google-chrome}"
	  cd ~/void-packages || exit
	  git pull
	  ./xbps-src pkg "$pkg"
	  sudo xbps-install --repository hostdir/binpkgs/nonfree "$pkg"
	  cd "$dir" || exit
	}

}

case $(uname) in
FreeBSD)
	freebsd
  ;;
Linux) # @TODO maybe fixme for other distros, if you ever hop again...
	voidlinux
  ;;
esac

