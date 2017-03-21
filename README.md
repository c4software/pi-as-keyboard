# Pi-as-keyboard

Make your Raspberry Pi act as a Keyboard.

The main purpose of this script is to « emulate » a keyboard when connected to a computer.

/ ! \ Important : Do not connect the Pi on the Power connector. Use the « Data » USB port.

All this setup as been tested on my Raspberry Pi Zero W the 2016/03/21.

## Install

Connect on the Pi and run the setup script.

```sh
$ sudo ./setup.sh
$ sudo reboot
```

![Screenshot](screenshot.png)

## Test the setup

This script will send Scancode to the computer connected on the Pi.

```
$ sudo test.sh
```
