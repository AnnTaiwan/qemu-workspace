#!/bin/bash
qemu-system-x86_64 \
    -enable-kvm \
    -cpu host \
    -m 16G \
    -smp 8 \
    -hda /home/annpc/Desktop/gem5_mine/qemu_workspace/disk_images/x86-ubuntu-14.04.6_v1.img \
    -net nic -net user \
    -serial mon:stdio \
