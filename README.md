## PingingPi

General purpose of this script is to make working with Raspberry Pi in headless mode easier. I often move my Pi around and connect it to different networks. The script makes Pi post its local and external IP to https://dweet.io in regular intervals of time. I use this information to connect to **VNC Server** already running on my Pi. Such connections are possible from local network or even from Internet *(port forwarding)*.

## Installation
Clone this repository somewhere in your Pi's HOME directory (or just download it there)
```
cd ~
git clone https://github.com/CodingMOFO/PingingPi.git
```
Run setup.sh
```
./setup.sh
```
Setup will ask you for 2 inputs:
1. Your dweet ID. Enter something unique. You will use this to access data sent out by `pingingpi.sh` script.
2. Ping interval in minutes. This is simple. Just enter number from 1 to 60. It means how often `pingingpi.sh` will be run.

And setup is done.

## Example
For example if during setup you entered
```
pretty-flowers
```
and then
```
1
```
then you will see your Pi's local and external IPs here:
```
http://dweet.io/follow/pretty-flowers
```
or here:
```
http://dweet.io/get/dweets/for/pretty-flowers
```
and this data will be updated every minute.
