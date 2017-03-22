# Pi-as-keyboard

Make your Raspberry Pi act as a Keyboard via HID emulation.

The main purpose of this setup script is to make the Pi « emulate » a keyboard when connected to a computer.

## Informations

This project is voluntary small and simple to be used as a base for more complex projects (like hot keyboard remapping, Pi as Keyboard controller, etc)

All this setup as been tested on my Raspberry Pi Zero W the 2016/03/21.

## Important

⚠️️  ⚠️️  Do not connect the Pi on the Power connector. Use the « Data » USB port instead to power and data exchange. 

## Install

Connect on the Pi and run the setup script.

```sh
$ sudo ./setup.sh
$ sudo reboot
```

![Screenshot](screenshot.png)

## Test the setup

This script will send scancodes to the computer connected on the Pi.

```
$ sudo test.sh
```
