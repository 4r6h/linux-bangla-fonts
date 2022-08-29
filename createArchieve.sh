#!/bin/bash

# ***************************************
# * Author: 4r6h/Rahat		        *
# * github: https://www.github.com/4r6h *
# ***************************************

   Off='\033[0m'	     # Text Reset

   # Regular Colors
   Black='\033[0;30m'        # Black
   Red='\033[0;31m'          # Red
   Green='\033[0;32m'        # Green
   Yellow='\033[0;33m'       # Yellow
   Blue='\033[0;34m'         # Blue
   Purple='\033[0;35m'       # Purple
   Cyan='\033[0;36m'         # Cyan
   White='\033[0;37m'        # White

   # Bold
   BBlack='\033[1;30m'       # Black
   BRed='\033[1;31m'         # Red
   BGreen='\033[1;32m'       # Green
   BYellow='\033[1;33m'      # Yellow
   BBlue='\033[1;34m'        # Blue
   BPurple='\033[1;35m'      # Purple
   BCyan='\033[1;36m'        # Cyan
   BWhite='\033[1;37m'       # White


archieveFolder="archieve"
BanglaFolder="Bangla-Fonts"
UrduFolder="Urdu-Fonts"
ArabicFolder="Arabic-Fonts"
UrduArabicFolder="Urdu-Arabic-Fonts"
archieveBangla="Linux-Bangla-Fonts.tar.gz"
archieveUrdu="Linux-Urdu-Fonts.tar.gz"
archieveArabic="Linux-Arabic-Fonts.tar.gz"
archieveUrduArabic="Linux-Urdu-Arabic-Fonts.tar.gz"

Folders=(
	"$BanglaFolder"
	"$ArabicFolder"
	"$UrduFolder"
	"$UrduArabicFolder"
)



for i in "${Folders[@]}"; do
    echo -e "\n${Green}PACKAGING: ${BYellow}${i}${Off}\n"

	if [ -d "${i}" ]; then
		if [ "$(ls -A ${i})" ]; then
			echo -e "\n${Green}Take action ${BRed}${i} ${Green}is not Empty.${Off}\n"
echo -e ${Green}
	     		tar -czvf Linux-"${i}".tar.gz "${i}"
     			mv Linux-"${i}".tar.gz $archieveFolder
		else
			echo -e "\n${BYellow}${i} ${BRed}is Empty.${Off}\n"
		fi
	else
		echo -e "\n${BYellow}Directory ${BRed}${i} ${BYellow}not found.${Off}\n"
	fi	
done
