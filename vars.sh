#!/bin/bash

# These, you'll definitely want to change.
export TARGET_ROOT=$(realpath target-root)
export SHARPINIT_PATH=/root/sharpinit
export SHARPINIT_RSYNC=kate@10.0.2.2:/home/kate/repos/sharpinit # comment out to disable
export AUX_PART=/dev/vda3

# These are dynamically generated from the above.
export UNITS_DIR=$TARGET_ROOT/etc/sharpinit/units
export AUX_MOUNT=$(mount | grep $AUX_PART | awk '{print $3}')
