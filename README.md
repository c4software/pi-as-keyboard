# Pi-as-keyboard

Make your Raspberry Pi act like a Keyboard via HID emulation.

The main purpose of this script is to make the Pi emulate a keyboard when connected to a computer.

## Information

This project is voluntary work and is small and simple designed to be used as a base for more complex projects (like hot keyboard remapping, etc)

This has been tested on my Raspberry Pi Zero W on the 21st of March 2016.

## WARNING

⚠️️  ⚠️️  Do not connect the Pi using the power connector. Use the data port instead. 

## Install

On the Pi and run the setup script.

```sh
$ sudo ./setup.sh
$ sudo reboot
```

![Screenshot](screenshot.png)

## Test the setup

This script will send scancodes to the computer connected to the Pi.

```
$ sudo test.sh
```
