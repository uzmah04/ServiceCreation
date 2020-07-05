#!/bin/bash

#To detect USB
usb="$(mount | grep '/dev/sdb')"

while [ true ]
do
	usb="$(mount | grep '/dev/sdb')"

	if [[ -z "$usb" ]]
	then
		echo "USB not detected"
	else
		# Go to home,
		# Verify if folder usb_mnt exists
		# Else create folder into which will mount the usb
		cd
		list_stuff="$(ls)"
		folder="usb_mnt"
		if [[ "$list_stuff" == *"$folder"* ]]
		then
		        echo "Folder usb_mnt present"
		else
		        mkdir usb_mnt
		        echo "Folder usb_mnt created"
		fi

		echo "USB detected"
	       	# Make a beep sound
	       	echo -en "\007"
		# Mount usb in folder usb_mnt
		sudo mount /dev/sdb1 usb_mnt
		echo "USB mounted"
		# Create a text document and write date and time into it
		cd usb_mnt
		touch usb_mounted.txt
		echo "$(date +%c)" > usb_mounted.txt
		# Unmount the usb
		cd ..
		sudo umount /dev/sdb1
		sudo umount /dev/sdb1
		echo "USB unmounted"
		# Make a beep sound
		echo -en "\007"
	fi
done
