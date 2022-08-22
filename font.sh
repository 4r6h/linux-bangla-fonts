#!/bin/bash
#-------------------------------
#
#	Created By Fahad Ahammed
#
# WEB: https://www.fahadahammed.com
# Date: 2019-02-04_23-43
#	Get me by email@fahadahammed.com or obak.krondon@gmail.com if you want to ...
#------------------------------------------------------------------------------

echo "Welcome to Bangla Font Installer from http://fahadahammed.com !!!"
echo "------------------------------------"
wgetexists=`/usr/bin/which wget`
fontcacheexists=`/usr/bin/which fc-cache`
if [[ `/usr/bin/which sudo` != "/usr/bin/sudo" ]];
then
    echo -e "\n";
    echo -e "Sorry, you are not eligible to install these fonts.\n";\
    exit;
fi
echo "Now starting to download and install all Bangla fonts..........."
echo -e "------------------------------------\n"
echo -e "\n"

if [ "$wgetexists" != "/usr/bin/wget" -o $fontcacheexists != "/usr/bin/fc-cache" ]
then
    if [ -z "$1" ]
    then
        echo -e "No argument supplied.\n";
        echo "This script needs specific tools to work perfectly.";
        echo -e "The required tools need to be installed before continuing.\n";
        echo "1. wget";
        echo -e "2. fontconfig\n";
        read -p "Continue (y/n)? " choice;
        case "$choice" in 
          y|Y ) if [ "$wgetexists" != "/usr/bin/wget" -o $fontcacheexists != "/usr/bin/fc-cache" ]; then sudo apt update;sudo apt install fontconfig wget -y;fi;;
          n|N ) echo -e "Bye Bye !\n";exit;;
          * ) echo -e "Invalid !\n"; exit;;
        esac
    fi
fi
#--
if [ ! -z "$1" ]
  then
    echo "Argument supplied: $1";
    if [[ "$1" == "install" ]];
    then
        if [ "$wgetexists" != "/usr/bin/wget" -o $fontcacheexists != "/usr/bin/fc-cache" ]
        then
            sudo apt update;sudo apt install fontconfig wget -y;
        fi
    else
        echo -e "Invalid Argument Passed !\n";
        exit;
    fi
fi


# Variables and choosing the mirror.
echo -e "Choosing best mirror to download the files.\n"
downloadUrls=("https://raw.githubusercontent.com/4r6h/linux-bangla-fonts/master/archieve/LinuxBanglaFonts.tar.gz")
# Directory
echo -e "Now creating the font directory for user: $USER.\n"
if [ $USER = "root" ]; then
  fontsDir="/root/.fonts/LinuxBanglaFonts"
fi
if [ $USER != "root" ]; then
  fontsDir="/home/$USER/.fonts/LinuxBanglaFonts"
fi
echo -e "\n"
if [ ! -d "$fontsDir" ]; then
  mkdir -p $fontsDir;
else
  echo -e "Upgrading bangla fonts provided by us....\n";
  rm -r $fontsDir;
  mkdir -p $fontsDir;
fi

echo -e "\n"
echo -e "Downloading compressed file from $finalurl....\n"
echo -e "\n"
/usr/bin/wget -v -P $fontsDir"/" $downloadUrls

# Check if file is there and extractable
cd $fontsDir"/"
if [ -f LinuxBanglaFonts.tar.gz ];
then
    echo -e "Downloaded file successfully to extract and install fonts !\n";
    tar -zxvf LinuxBanglaFonts.tar.gz;
    rm LinuxBanglaFonts.tar.gz;
else
    echo -e "Fonts couldn't be retrieved. So exiting the installation.\n";
    exit;
fi

cd

echo -e "\n"
echo -e "Initiating font refresh......\n"
/usr/bin/fc-cache -f -v
echo -e "\n"

echo "------------------------------------"
echo "Download and Installation Complete !!!"
echo -e "Script is Created by Fahad Ahammed\n"
echo -e "Website: http://fahadahammed.com\n"
