#!/bin/bash
# TJ Houston @tjhouston tj@tjhouston.com
# Sept 2013

HomepageName="http://www.huronhs.com/learn.html"


#Pre-Flight

# Check we are running as root

    currentUser=`whoami`
    if [ $currentUser != "root" ] ; #If user is not root do not attempt to run Script
	
	then
        echo "This script must be run with super user privileges"

    else #If We Are Running as Root Run Command With Variables	
		
#Set Home Page

defaults write com.apple.Safari HomePage "${HomepageName}"

	echo "Safari Has Been Baked!" #Verified Complete
fi
