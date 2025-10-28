#!/bin/bash
sudo apt update
sudo apt install qemu-system
# libvirt-bin ubuntu-vm-builder are too old, and it don't need bridge-utils.
# sudo apt install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils qemu-utils
sudo apt install qemu-kvm  qemu-utils