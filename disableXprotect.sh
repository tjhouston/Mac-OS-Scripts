#!/bin/sh

xprotectLocation="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/XProtect.meta.plist"

# Make XProtectUpdater not executable
# Remove Plugin Blacklist from plist location
sudo chmod 000 /usr/libexec/XProtectUpdater
sudo /usr/libexec/PlistBuddy -c "Delete :PlugInBlacklist" $xprotectLocation
#Disable Launch Daemon
sudo /usr/libexec/PlistBuddy -c "ADD :Disabled bool" /System/Library/LaunchDaemons/com.apple.xprotectupdater.plist
sudo /usr/libexec/PlistBuddy -c "SET :Disabled true" /System/Library/LaunchDaemons/com.apple.xprotectupdater.plist

exit 0;