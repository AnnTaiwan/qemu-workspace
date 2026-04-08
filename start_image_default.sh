#!/bin/bash
IMAGE=${1:-"disk_images/x86-ubuntu-14.04.6_v2.img"}
qemu-system-x86_64 \
    -enable-kvm \
    -cpu host \
    -m 16G \
    -smp 8 \
    -hda $IMAGE \
    -net nic -net user \
    -serial mon:stdio \
