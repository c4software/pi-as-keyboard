#!/bin/bash

# Test if is Root
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

systemctl disable enable_hid.service
rm -rf /usr/bin/enable_hid.sh
rm -rf /lib/systemd/system/enable_hid.service

reboot
