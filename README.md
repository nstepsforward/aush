## AUSH

This simple script was made to be used as an utilitary to deny traffic in your LAN using dsniff arpspoof.

# Prerequisites
Runned and tested on:
Linux * 4.9.0-8-amd64 #1 SMP Debian 4.9.110-3+deb9u6 (2018-10-08) x86_64 GNU/Linux

Should work on most Linux distributions.

# "Install"

Actually there is no installation, getting the aush.sh to your machine, give the right permissions to the file and execute with root permissions.

# Running it

Running the script,

`./aush.sh`

you will asked for that things, respectively:

```
Enter the interface module to be used:
Enter the network gateway:
Enter the target IP:
```

You can get the interface module and network gateway using `ifconfig`(https://linux.die.net/man/8/ifconfig) or `ip addr show`(https://linux.die.net/man/8/ip), then, choose the target (Use this responsibly).

# Example

![Image of aush teste](http://brokeclothing.com.br/aushexample.png)

# **I am a beginner in shell script language and this repo was my first contact with him, i wanna improve my knowledge in that and contribute efficiently with the community.

# Questions and sugestions should be send to <slucasandrade@prontonmail.ch>**
