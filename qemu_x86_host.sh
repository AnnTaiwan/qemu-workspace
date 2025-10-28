#!/bin/bash
# qemu-system-x86_64 \
#     -enable-kvm \
#     -cpu host \
#     -smp 8 \
#     -m 16G \
#     -hda /home/annpc/Desktop/gem5_mine/qemu_workspace/disk_images/x86-ubuntu-14.04.6_v1.img \
#     -kernel /home/annpc/Desktop/gem5_mine/qemu_workspace/bzImages/bzImage \
#     -append 'root=/dev/hda1 console=ttyS0 memmap=8G!9G nokaslr norandmaps' \
#     -serial mon:stdio \
#     -net user -net nic \
#     # -net user,hostfwd=tcp::10022-:22 -net nic \
# Default values
DISK_IMAGE="/home/annpc/Desktop/gem5_mine/qemu_workspace/disk_images/x86-ubuntu-14.04.6_v1.img"
KERNEL="/home/annpc/Desktop/gem5_mine/qemu_workspace/bzImages/bzImage"
NOGRAPHIC=false

# Usage function
usage() {
    echo "Usage: $0 [-h] [-i disk_image] [-k kernel] [-g yes|no]"
    echo "  -h              Print this help message"
    echo "  -i disk_image   Path to disk image, Default is $DISK_IMAGE"
    echo "  -k kernel       Path to kernel, Default is $KERNEL"
    echo "  -g yes|no       Use -nographic if types no, default is without -nographic"
    exit 1
}

# Parse arguments
while getopts "hi:k:g:" opt; do
    case $opt in
        h) usage ;;
        i) DISK_IMAGE="$OPTARG" ;;
        k) KERNEL="$OPTARG" ;;
        g) 
            if [[ "$OPTARG" == "no" ]]; then
                NOGRAPHIC=true
            fi
            ;;
        \?) # Invalid option
            echo "Invalid option: -$OPTARG"
            usage
            ;;
    esac
done

# Build QEMU command
QEMU_CMD="qemu-system-x86_64 \
    -enable-kvm \
    -cpu host \
    -smp 8 \
    -m 16G \
    -hda $DISK_IMAGE \
    -kernel $KERNEL \
    -append 'root=/dev/hda1 console=ttyS0 memmap=8G!9G nokaslr norandmaps' \
    -serial mon:stdio \
    -net user -net nic"
    # -netdev user,id=net0 -device rtl8139,netdev=net0"
    # -netdev user,id=net0 -device e1000,netdev=net0"
    # -net user -net nic"
    # -netdev user,id=net0 -device e1000,netdev=net0

# Add -nographic if requested
if $NOGRAPHIC; then
    QEMU_CMD="$QEMU_CMD -nographic"
fi

# Execute
echo "Running: $QEMU_CMD"
eval $QEMU_CMD
