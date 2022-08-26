#!/bin/bash

# ***************************************
# * Author: 4r6h/Rahat		        *
# * github: https://www.github.com/4r6h *
# ***************************************

echo "Welcome to Linux Font Installer from 4r6h/Rahat !!!"
echo "------------------------------------"
wgetexists=`/usr/bin/which wget`
fontcacheexists=`/usr/bin/which fc-cache`
if [[ `/usr/bin/which sudo` != "/usr/bin/sudo" ]];
then
    echo -e "\n";
    echo -e "Sorry, you are not eligible to install these fonts.\n";\
    exit;
fi
echo "Now starting to download and install all fonts..........."
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
          y|Y ) if [ "$wgetexists" != "/usr/bin/wget" -o $fontcacheexists != "/usr/bin/fc-cache" ]; then sudo pacman -Syy;sudo pacman -S fontconfig wget --noconfirm --needed;fi;;
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
            sudo pacman -Syy;sudo pacman -S fontconfig wget --noconfirm --needed;
        fi
    else
        echo -e "Invalid Argument Passed !\n";
        exit;
    fi
fi

urls=(
'https://raw.githubusercontent.com/4r6h/linux-fonts/master/archieve/Linux-Bangla-Fonts.tar.gz' 
'https://raw.githubusercontent.com/4r6h/linux-fonts/master/archieve/Linux-Urdu-Fonts.tar.gz'
'https://raw.githubusercontent.com/4r6h/linux-fonts/master/archieve/Linux-Arabic-Fonts.tar.gz'
)

# Directory
echo -e "Now creating the font directory for user: $USER.\n"
if [ $USER = "root" ]; then
  fontsDir="/root/.fonts/Linux-Fonts/"
fi
if [ $USER != "root" ]; then
  fontsDir="/home/$USER/.fonts/Linux-Fonts/"
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
echo -e "Downloading compressed file from github.com....\n"
echo -e "\n"

for url in "${urls[@]}"; do
/usr/bin/wget -P $fontsDir "$url"
done

# Check if file is there and extractable
fonts=(
'Linux-Bangla-Fonts.tar.gz'
'Linux-Urdu-Fonts.tar.gz'
'Linux-Arabic-Fonts.tar.gz'
)

cd $fontsDir
if [ -e "Linux-Bangla-Fonts.tar.gz" || -e "Linux-Urdu-Fonts.tar.gz" || -e "Linux-Arabic-Fonts.tar.gz" ];
then
	echo -e "Downloaded file successfully to extract and install fonts !\n"
	for font in "${fonts[@]}"; do
		tar -zxvf $font
	done
		rm ${fonts[@]}
else
	echo -e "Fonts couldn't be retrieved. So exiting the installation.\n"
	exit
fi

cd

echo -e "\n"
echo -e "Initiating font refresh......\n"
/usr/bin/fc-cache -f -v
echo -e "\n"

echo "------------------------------------"
echo "Download and Installation Complete !!!"
echo -e "Script is Created by 4r6h/Rahat\n"
echo -e "Follow me on Github github.com/4r6h\n"
