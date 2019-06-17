# AUSH

This simple script was made to be used as an utilitary to deny traffic in your LAN using dsniff arpspoof.

## Prerequisites

Be sure dSniff is installed.

`apt-get install dsniff`

Runned and tested on:

```
# uname -a
Linux * 4.9.0-8-amd64 #1 SMP Debian 4.9.110-3+deb9u6 (2018-10-08) x86_64 GNU/Linux
```

Should work on most Linux distributions.

## Using it

```
# cd ~/$USER
# git clone https://github.com/nstepsforward/aush
# chmod +x aush.sh
# ./aush.sh
```

You will probably be asked for these things, respectively:

```
Enter the interface module to be used:
Enter the network gateway:
Enter the target IP:
```

You can get the interface module using `ifconfig`(https://linux.die.net/man/8/ifconfig) or `ip addr show`(https://linux.die.net/man/8/ip). For the network gateway, try `route`(https://linux.die.net/man/8/route) or `netstat -rn`(https://linux.die.net/man/8/netstat), then, set target IP.
Use this responsibly.

## Example

![Image of aush teste](https://user-images.githubusercontent.com/44345505/59615075-4e369580-90f8-11e9-8530-90c4564dfd68.png)

###### I am a beginner in shell script language and this repo was my first contact with him, I'm improving to contribute efficiently to the community.

###### Questions and sugestions should be send to <slucasandrade@prontonmail.ch>.

## Peace
