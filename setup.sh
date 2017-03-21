#!/bin/bash

# Test if is Root
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

# Enable dwc2 on the Pi
echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt

# Enable dwc2 initialisation
echo "dwc2" | sudo tee -a /etc/modules

# Install service
cp enable_hid.service /lib/systemd/system/

# Install script
cp enable_hid.sh /usr/bin/
chmod +x /usr/bin/enable_hid.sh

# Enable service
systemctl enable enable_hid.service
