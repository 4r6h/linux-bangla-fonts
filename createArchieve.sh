#!/bin/bash

# ***************************************
# * Author: 4r6h/Rahat		        *
# * github: https://www.github.com/4r6h *
# ***************************************

archieveFolder="archieve"
BanglaFolder="Bangla-Fonts"
UrduFolder="Urdu-Fonts"
ArabicFolder="Arabic-Fonts"
archieveBangla="Linux-Bangla-Fonts.tar.gz"
archieveUrdu="Linux-Urdu-Fonts.tar.gz"
archieveArabic="Linux-Arabic-Fonts.tar.gz"

Folders=(
	"$BanglaFolder"
	"$ArabicFolder"
	"$UrduFolder"
)



for i in "${Folders[@]}"; do
    echo "COPYING: ${i}"

if [ -d "${i}" ]
then
	if [ "$(ls -A ${i})" ]; then
     echo "Take action ${i} is not Empty"
     tar -czvf Linux-"${i}".tar.gz "${i}"
     mv Linux-"${i}".tar.gz $archieveFolder
	else
    echo "${i} is Empty"
	fi
else
	echo "Directory ${i} not found."
fi
done
