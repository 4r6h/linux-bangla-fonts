# Bangla, Urdu and Arabic Fonts for your Linux Machine

Welcome to Bangla font installer for linux. This script is tested or maintained only for Debian based distributions like Ubuntu, Debian, Linux Mint, Deepin etc.

### Dependency

It depends on some tools which you have to allow it to install, it will ask.

- wget
- fontconfig

## Install:
### pypi version
Make sure you pip3 installed

```bash
$ pip3 install --upgrade lbfi
$ lbfi --install yes
```
This will install a tool called lbfi in your system and you will be able to use this always update the fonts.

PyPi link: https://pypi.org/project/lbfi/

### For Bangla Fonts Only
```bash
wget --no-check-certificate https://raw.githubusercontent.com/4r6h/linux-fonts/master/dist/lbfi -O lbfi;chmod +x lbfi;./lbfi
```

### For All Fonts
```
wget --no-check-certificate https://raw.githubusercontent.com/4r6h/linux-fonts/master/font.sh -O font.sh;chmod +x font.sh;bash font.sh;rm font.sh
```

