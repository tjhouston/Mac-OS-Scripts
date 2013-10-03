#!/bin/bash
# TJ Houston @tjhouston tj@tjhouston.com
# March 2012

HomepageName="http://www.huronhs.com/learn.html"


#Pre-Flight

# Check we are running as root

    currentUser=`whoami`
    if [ $currentUser != "root" ] ; #If user is not root do not attempt to run Script
	
	then
        echo "This script must be run with super user privileges"

    else #If We Are Running as Root Run Command With Variables		
	
	#Add safari to the dock:
	defaults write com.apple.dock persistent -apps -array -add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key>
	<string>/Applications/Safari.app</string><key>_CFURLStringType</key>
	<integer>0</integer></dict></dict></dict>'

	#Relaunch Dock

	killall -HUP Dock

	#Set Home Page

	defaults write com.apple.Safari HomePage "${HomepageName}"
	
		echo "Safari Has Been Baked!" #Verified Complete
	fi





