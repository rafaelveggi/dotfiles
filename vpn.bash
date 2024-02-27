#!/usr/bin/bash

case $1 in
	"o")
		echo "disconnecting from vpn"
		sudo pkill openfortivpn
	;;
	*)
		f=$(echo $RANDOM | md5sum | cut -d " " -f 1)
		gpg -dq /home/raf/dotfiles/raf.ovpn.gpg > "$f" 
		sudo openfortivpn --config "$f" >> /tmp/popenfortivpn.log &
		sleep 1
		rm -f "$f"
		unset f
	;;
esac

