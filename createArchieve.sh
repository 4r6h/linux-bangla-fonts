#!/bin/bash
#-------------------------------
#
# Archieve Creator
#
#	Created By Fahad Ahammed
#
#	Get me by email@fahadahammed.com or obak.krondon@gmail.com if you want to ...
#-------------------------------


archieveFolder="archieve"
BanglaFolder="Bangla-Fonts"
UrduFolder="Urdu-Fonts"
ArabicFolder="Arabic-Fonts"
archieveBangla="LinuxBanglaFonts.tar.gz"
archieveUrdu="LinuxUrduFonts.tar.gz"
archieveArabic="LinuxArabicFonts.tar.gz"


#if [ -e "$archieveFolder/$archiveBangla" ]; then
#    echo "File exists";
#    rm $archieveFolder/$archiveBangla;
#    cd $BanglaFolder; tar -zcvf LinuxBanglaFonts.tar.gz *;mv $archieveBangla ../$archieveFolder/;
#else
#    echo "File does not exist";
#    cd $BanglaFolder; tar -zcvf LinuxBanglaFonts.tar.gz *;mv $archieveBangla ../$archieveFolder/;
#fi 

if [ -e "$archieveFolder/$archiveUrdu" ]; then
    echo "File exists";
    rm "$archieveFolder/$archiveUrdu"
    cd $UrduFolder; tar -zcvf LinuxUrduFonts.tar.gz *;mv $archieveUrdu ../$archieveFolder/;
else
    echo "File does not exist";
    cd $UrduFolder; tar -zcvf LinuxUrduFonts.tar.gz *;mv $archieveUrdu ../$archieveFolder/;
fi 

#if [ -e "$archieveFolder/$archiveArabic" ]; then
#    echo "File exists";
#    rm $archieveFolder/$archiveArabic;
#    cd $ArabicFolder; tar -zcvf LinuxArabicFonts.tar.gz *;mv $archieveArabic ../$archieveFolder/;
#else
#    echo "File does not exist";
#    cd $ArabicFolder; tar -zcvf LinuxArabicFonts.tar.gz *;mv $archieveArabic ../$archieveFolder/;
#fi 
#
