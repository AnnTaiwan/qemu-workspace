#!/bin/bash
# Reference: https://qemu-project.gitlab.io/qemu/system/images.html
# https://www.gem5.org/documentation/general_docs/fullsystem/disks
qemu-img create x86-ubuntu-14.04.6.img 4G
qemu-system-x86_64 \
    -hda x86-ubuntu-14.04.6.img \
    -cdrom ubuntu-14.04.6-server-amd64.iso \
    -m 1024 \
    -enable-kvm \
    -boot d
# Install Ubuntu
qemu-system-x86_64 -hda x86-ubuntu-14.04.6.img -cdrom ubuntu-14.04.6-server-amd64.iso -m 1024  -enable-kvm -boot d
# Use it without -boot d
qemu-system-x86_64 -hda x86-ubuntu-14.04.6.img -m 1024 -enable-kvm -serial mon:stdio
