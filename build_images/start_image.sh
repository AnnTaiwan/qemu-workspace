#!/bin/bash
qemu-system-x86_64 \
    -enable-kvm \
    -cpu host \
    -m 16G \
    -smp 8 \
    -hda x86-ubuntu-14.04.6.img \
    -serial mon:stdio \
    -net nic -net user \
