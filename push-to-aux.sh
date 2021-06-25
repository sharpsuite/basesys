#!/bin/bash
source ./vars.sh

if [[ !(-e $AUX_MOUNT) ]]; then
    echo couldn\'t find $AUX_PART
    exit 1
fi

if [ -n "$SHARPINIT_RSYNC" ]; then
	echo pulling sharpinit...
	rsync -ur $SHARPINIT_RSYNC $SHARPINIT_PATH
elif [[ !(-d $SHARPINIT_PATH) ]]; then
	echo $SHARPINIT_PATH is empty: exiting
	exit 1
fi

cd $SHARPINIT_PATH
dotnet build
cp -fr $SHARPINIT_PATH $AUX_MOUNT/dotnet/
cp -fr $TARGET_ROOT/* $AUX_MOUNT/
