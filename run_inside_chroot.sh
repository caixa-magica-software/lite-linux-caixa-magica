#!/bin/sh
#
#  run_inside_chroot.sh - Run inside chroot of LLCM
# 
#  Copyright (C) 2020 Caixa Mágica.
# 
# 
#  Written by: Adriano Campos <adriano.campos@caixamagica.pt>
# 

################################################################################################################
# Prepare root filesystem
sudo apt update -y
sudo apt upgrade -y
################################################################################################################

################################################################################################################
# BootSplash - Plymouth
sudo ln -sf /usr/share/plymouth/themes/LLCM-logo/LLCM-logo.plymouth /etc/alternatives/default.plymouth
sudo update-initramfs -u
###############################################################################################################

################################################################################################################
# Install Apps
sudo apt install -y anki klettres kanagram gcompris childsplay kstars kwordquiz scratch tuxmath tuxpaint tuxtype 
sudo apt install -y geogebra gnome-dictionary kalzium kbruch kalgebra kturtle marble kgeography pidgin
sudo apt install -y gnome-dictionary vokoscreen ktuberling stellarium thunderbird mplayer audacity cheese
# vym - View Your Mind
sudo apt install -y vym
sudo cp /usr/share/vym/lang/vym.pt_BR.qm /usr/share/vym/lang/vym.pt_PT.qm
# celestia
wget -O- https://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add -
sudo add-apt-repository "deb https://dl.bintray.com/celestia/releases-deb bionic universe"
sudo apt-get update
sudo apt install -y celestia
# secret chronicles
wget https://ftp.secretchronicles.org/releases/TSC-2.1.0-focal-amd64.deb
sudo apt install -y ./TSC-2.1.0-focal-amd64.deb
rm TSC-2.1.0-focal-amd64.deb
# veyon
sudo add-apt-repository ppa:veyon/stable -y
sudo apt-get update
sudo apt-get install -y veyon
################################################################################################################

################################################################################################################
# Install PT Language for using PC offline with Portuguese language available - check-language-support -l pt
sudo apt install -y firefox-locale-pt gnome-getting-started-docs-pt gnome-user-docs-pt hunspell-pt-br hunspell-pt-pt 
sudo apt install -y hyphen-pt-br hyphen-pt-pt language-pack-gnome-pt language-pack-pt libreoffice-help-pt libreoffice-help-pt-br 
sudo apt install -y libreoffice-l10n-pt libreoffice-l10n-pt-br mythes-pt-pt thunderbird-locale-pt thunderbird-locale-pt-br 
sudo apt install -y thunderbird-locale-pt-pt wbrazilian wportuguese
################################################################################################################