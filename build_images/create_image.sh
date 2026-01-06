#!/bin/bash
# Reference: https://qemu-project.gitlab.io/qemu/system/images.html
# https://www.gem5.org/documentation/general_docs/fullsystem/disks
IMAGE="x86-ubuntu-14.04.6.img"
ISO="ubuntu-14.04.6-server-amd64.iso"
qemu-img create $IMAGE 4G
qemu-system-x86_64 \
    -hda $IMAGE \
    -cdrom $ISO \
    -m 1024 \
    -enable-kvm \
    -boot d
# Install Ubuntu
qemu-system-x86_64 -hda $IMAGE -cdrom $ISO -m 1024 -enable-kvm -boot d
# Use it without -boot d
qemu-system-x86_64 -hda $IMAGE -m 1024 -enable-kvm -serial mon:stdio
