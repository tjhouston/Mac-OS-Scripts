# !/bin/bash
# Create folders from CSV
# TJ Houston @tjhouston tj@tjhouston.com
# October 3rd 2013

# Set Variables
INPUT=folders.csv
# Set IFS (Internal Filed Seperator) system variable as ifs variable which is set as a ,
OLDIFS=$IFS
IFS=,

#Verify CSV is available
	[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
# While loop to loop through CSV 
	while read folderName
	do
		mkdir $folderName
		chmod 777 $folderName
		echo "$folderName Folder Was Created"
		
	done < $INPUT
#Set back to old ifs
	IFS=$OLDIFS
	
	echo "Do you wish to Remove the CSV and Delete This Script?"
	select yn in "Yes" "No"; do
	    case $yn in
	        Yes ) 
				rm folders.csv
				rm -- "$0"
				exit;;
	        No ) exit;;
	    esac
	done
