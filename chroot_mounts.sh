#!/usr/bin/bash

mount /dev/nvme0n1p3 /mnt
mount /dev/nvme0n1p1 /mnt/boot/efi

mount --rbind /dev /mnt/dev
mount --make-rslave /mnt/dev
mount -t proc /proc /mnt/proc
mount --rbind /sys /mnt/sys
mount --make-slave /mnt/sys
mount --rbind /tmp /mnt/tmp
mount --bind /run /mnt/run

