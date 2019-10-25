#!/bin/bash

# Test if is Root
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

for run in {1..10}
do
	echo -ne "\x00\x00\x04\x00\x00\x00\x00\x00" > /dev/hidg0
	echo -ne "\x00\x00\x00\x00\x00\x00\x00\x00"  > /dev/hidg0
done
