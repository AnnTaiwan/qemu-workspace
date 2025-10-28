#!/bin/bash
qemu-system-x86_64 \
    -enable-kvm \
    -cpu host \
    -smp 8 \
    -m 16G \
    -hda /home/annpc/Desktop/gem5_mine/qemu_workspace/disk_images/x86-example_lung.img \
    -kernel /home/annpc/Desktop/gem5_mine/qemu_workspace/bzImages/bzImage \
    -append 'root=/dev/hda1 console=ttyS0 memmap=8G!9G nokaslr norandmaps' \
    -serial mon:stdio \
    -net user

    # -net user,hostfwd=tcp::10022-:22 -net nic \

# -drive file=/home/annpc/Desktop/gem5_mine/qemu_workspace/disk_images/x86-example.img,format=raw,if=ide \
# -hda /home/annpc/Desktop/gem5_mine/qemu_workspace/disk_images/x86-example.img \
    # -hda /home/annpc/Desktop/gem5_mine/qemu_workspace/disk_images/x86-ubuntu-14.04.6_v1.img \
