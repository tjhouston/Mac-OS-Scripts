#!/bin/bash
# Install Printers VIA ARD Using lpadmin
# TJ Houston @tjhouston tj@tjhouston.com
# April 24th 2012

#Define Variables

QueueName="BOECopier" #Name of Que
PrintLocation="Board Of Education" #Where is Your Printer Located
PrintDescription="BOE Copier Test" #Description of the Printer
PrinterIP="10.13.0.30" #enter the printer IP Here for Direct Connect else enter cups Server info 
PPDfile="/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/Resources/Generic.ppd" #Location of the PPD File
IsShared="true" #Do You Want the Printer Shared or Not (true or false)

#Pre-Flight

# Check we are running as root

    currentUser=`whoami`
    if [ $currentUser != "root" ] ; #If user is not root do not attempt to install printers
	
	then
        echo "This script must be run with super user privileges"
    else #If We Are Running as Root Run Command With Variables		
		lpadmin  -p "${QueueName}"  -E  -v lpd://"${PrinterIP}" -P "${PPDfile}" -L "${PrintLocation}" -D "${PrintDescription}" -o printer-is-shared="${IsShared}"
		echo "Ding Fries Are Done!" #Verified Complete
	fi
	
# Just In Case Restart the CupsDaemon
# Tip: Comment Out What You Dont Need
#
# 10.5.x
launchctl unload /System/Library/LaunchDaemons/org.cups.cupsd.plist
launchctl load /System/Library/LaunchDaemons/org.cups.cupsd.plist
# 10.4.x
/System/Library/StartupItems/PrintingServices/PrintingServices restart

