#!/bin/bash

test x`facter virtual` != xphysical || exit 0
test x`facter virtual` != xkvm || exit 0 # ugly hack for QCOW2 swelling too much

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Sync to ensure that the delete completes before this moves on.
sync
sync
sync

# additionally show the disk usage
df -h
