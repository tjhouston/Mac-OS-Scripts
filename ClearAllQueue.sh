#!/bin/bash
# Clear All Printer Queue's
# TJ Houston @tjhouston tj@tjhouston.com
# April  2012

# Check we are running as root

    currentUser=`whoami`
    if [ $currentUser != "root" ] ; #If user is not root do not attempt to install printers
	
	then
        echo "This script must be run with super user privileges"
    else #If We Are Running as Root Run Command With Variables		
		lpstat -p | awk '{print $2}' | while read printer
		do
		  echo "Clearing Queue for Printer:" $printer
		  lprm - -P $printer
		done
	fi

