#!/bin/bash
# Reset Dock and Make in Un-editable
# TJ Houston @tjhouston tj@tjhouston.com
# December 13th 2012

#First we delete current dock
rm ~/Library/Preferences/com.apple.dock.plist
#Reset Dock
killall "Dock"
#Make Dock Un-editable
defaults write com.apple.dock contents-immutable -bool TRUE
#Reset Dock
killall "Dock"