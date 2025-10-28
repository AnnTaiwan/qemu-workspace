#!/bin/bash
DEFAULT_IMAGE=/home/annpc/Desktop/gem5_mine/qemu_workspace/disk_images/x86-ubuntu-14.04.6_v1.img
DEFAULT_MOUNT_DIR=my_mnt
# Check arguments
if [ $# -eq 2 ]; then
    DEFAULT_IMAGE="$1"
    DEFAULT_MOUNT_DIR="$2"
elif [ $# -eq 1 ]; then
    DEFAULT_IMAGE="$1"
fi

# Create mount dir if not exists
if [ ! -d "$DEFAULT_MOUNT_DIR" ]; then
    mkdir -p "$DEFAULT_MOUNT_DIR"
fi

# Mount partition
# 2048 sectors × 512 bytes = offset 1048576 (common for first partition)
echo "sudo mount  -o  loop,offset=$((2048*512)) $DEFAULT_IMAGE $DEFAULT_MOUNT_DIR"
echo "Mounting image:"
echo "  Image: $DEFAULT_IMAGE"
echo "  Mount point: $DEFAULT_MOUNT_DIR"
echo

sudo mount  -o  loop,offset=$((2048*512)) $DEFAULT_IMAGE $DEFAULT_MOUNT_DIR

# Confirm success
if [ $? -eq 0 ]; then
    echo "Mounted successfully at $DEFAULT_MOUNT_DIR"
    echo "To unmount: sudo umount $DEFAULT_MOUNT_DIR"
else
    echo "ERROR: Mount failed. Check image path or permissions."
fi