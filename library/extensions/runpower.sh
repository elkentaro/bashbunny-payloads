#!/bin/bash
#
# Run Complex PowerShells v1.0 by @elkentaro
# Simplifies executing commands from HID attacks without having to require escaping special characters by encoding the command 
# to a base64 string and pass it as an encoded command.
# To use it , setup a txt file with the powershell command and call the file with the command:
# RUNPOWER switch1/psscript.txt 
#  
#
#  - inside the psscript.txt - 
# Set-WinUserLanguageList -LanguageList en-US -force;
#


payloads="/root/udisk/payloads/"

function RUNPOWER() {
   local Pcommand=$1
   
   
   [[ -z "$Pcommand" ]] && exit 1 # txt file containing the powershell script has to be given.
		 encodecmd=$(iconv -t UTF-16LE $payloads/$Pcommand | base64)
		 QUACK DELAY 1000 		
         QUACK GUI r
         QUACK DELAY 500
         QUACK STRING "Powershell.exe　-enc $encodedcmd"
         QUACK ENTER
         ;;

}

export -f RUNPOWER