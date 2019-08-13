#!/bin/bash
# this is a stripped down version of https://github.com/ckuethe/usbarmory/wiki/USB-Gadgets - I don't claim any rights

# Initial Setup
modprobe libcomposite
cd /sys/kernel/config/usb_gadget/
mkdir -p g1
cd g1

# Device description
echo 0x1d6b > idVendor # Linux Foundation
echo 0x0104 > idProduct # Multifunction Composite Gadget
echo 0x0100 > bcdDevice # v1.0.0
echo 0x0200 > bcdUSB # USB2

echo 0xEF > bDeviceClass
echo 0x02 > bDeviceSubClass
echo 0x01 > bDeviceProtocol

mkdir -p strings/0x409
echo "fedcba9876543210" > strings/0x409/serialnumber
echo "Valentin Brosseau" > strings/0x409/manufacturer
echo "Keyboard-dev" > strings/0x409/product

# Define a Keyboard
mkdir -p functions/hid.usb0
echo 1 > functions/hid.usb0/protocol
echo 1 > functions/hid.usb0/subclass
echo 8 > functions/hid.usb0/report_length
echo -ne \\x05\\x01\\x09\\x06\\xa1\\x01\\x05\\x07\\x19\\xe0\\x29\\xe7\\x15\\x00\\x25\\x01\\x75\\x01\\x95\\x08\\x81\\x02\\x95\\x01\\x75\\x08\\x81\\x03\\x95\\x05\\x75\\x01\\x05\\x08\\x19\\x01\\x29\\x05\\x91\\x02\\x95\\x01\\x75\\x03\\x91\\x03\\x95\\x06\\x75\\x08\\x15\\x00\\x25\\x65\\x05\\x07\\x19\\x00\\x29\\x65\\x81\\x00\\xc0 > functions/hid.usb0/report_desc
mkdir -p configs/c.1
ln -s functions/hid.usb0 configs/c.1/

# Define a Mouse
# mkdir -p functions/hid.usb1
# echo 1 > functions/hid.usb1/protocol
# echo 1 > functions/hid.usb1/subclass
# echo 3 > functions/hid.usb1/report_length
# echo -ne \\x05\\x01\\x09\\x02\\xa1\\x01\\x09\\x01\\xa1\\x00\\x05\\x09\\x19\\x01\\x29\\x03\\x15\\x00\\x25\\x01\\x95\\x03\\x75\\x01\\x81\\x02\\x95\\x01\\x75\\x05\\x81\\x03\\x05\\x01\\x09\\x30\\x09\\x31\\x15\\x81\\x25\\x7f\\x75\\x08\\x95\\x02\\x81\\x06\\xc0\\xc0 > functions/hid.usb1/report_desc
# ln -s functions/hid.usb1 configs/c.1/

# Define a joystick
# mkdir -p functions/hid.usb2
# echo 0 > functions/hid.usb2/protocol
# echo 0 > functions/hid.usb2/subclass
# echo 8 > functions/hid.usb2/report_length
# echo -ne \\x05\\x01\\x15\\x00\\x09\\x04\\xa1\\x01\\x05\\x02\\x09\\xbb\\x15\\x81\\x25\\x7f\\x75\\x08\\x95\\x01\\x81\\x02\\x05\\x01\\x09\\x01\\xa1\\x00\\x09\\x30\\x09\\x31\\x95\\x02\\x81\\x02\\xc0\\x09\\x39\\x15\\x00\\x25\\x03\\x35\\x00\\x46\\x0e\\x01\\x65\\x14\\x75\\x04\\x95\\x01\\x81\\x02\\x05\\x09\\x19\\x01\\x29\\x04\\x15\\x00\\x25\\x01\\x75\\x01\\x95\\x04\\x55\\x00\\x65\\x00\\x81\\x02\\xc0 > functions/hid.usb2/report_desc
# ln -s functions/hid.usb2 configs/c.1/

# OS descriptors
echo 1       > os_desc/use
echo 0xcd    > os_desc/b_vendor_code
echo MSFT100 > os_desc/qw_sign
ln -s configs/c.1 os_desc

mkdir -p configs/c.1/strings/0x409
echo "Config 1: Keyboard" > configs/c.1/strings/0x409/configuration
echo 250 > configs/c.1/MaxPower
ls /sys/class/udc > UDC
