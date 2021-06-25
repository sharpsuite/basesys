#!/bin/bash
source ./vars.sh

maybe_relink() {
	if [[ (-h $2) ]]; then
		rm $2
	fi
	ln -s $1 $2
}

maybe_relink_dir() {
	if [[ (-h $2) ]]; then
		rm $2
	fi
	ln -d $1 $2
}

maybe_relink_dir /bin $TARGET_ROOT/usr/bin

if [[ !(-e $UNITS_DIR/getty@.service) ]]; then
	echo missing getty@.service in $TARGET_ROOT
	exit 1
fi

mkdir -p $UNITS_DIR/default.target.wants/
maybe_relink /etc/sharpinit/units/getty.target $UNITS_DIR/default.target.wants/getty.target

mkdir -p $UNITS_DIR/getty.target.wants/
for i in $(seq 1 7); do
	maybe_relink /etc/sharpinit/units/getty@.service $UNITS_DIR/getty.target.wants/getty@tty$i.service
done
