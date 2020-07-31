#!/bin/bash
#
#  Prepare root filesystem.sh - Prepare root filesystem for LLCM
# 
#  Copyright (C) 2020 Caixa Mágica.
# 
# 
#  Written by: Adriano Campos <adriano.campos@caixamagica.pt>
# 

echo "################################################################################################################"
echo "Prepare root filesystem"
FS="/home/adriano/LLCM/LLCM/custom-root/"
CD="/home/adriano/LLCM/LLCM/custom-disk/"
echo $FS

################################################################################################################
# Wallpaper images
sudo mkdir $FS/usr/share/LLCM/
sudo mkdir $FS/usr/share/LLCM/wallpapers/
sudo cp lxqt/wallpaper/LLCM-default-wallpaper.png $FS/usr/share/LLCM/wallpapers/
################################################################################################################

################################################################################################################
# Lxqt session
sudo rm $FS/usr/share/xsessions/*.desktop
sudo cp lxqt/LLCM.desktop $FS/usr/share/xsessions/
################################################################################################################

################################################################################################################
# xdg
sudo cp --recursive xdg-LLCM/ $FS/etc/xdg/
################################################################################################################

################################################################################################################
# BootSplash - Plymouth
sudo cp --recursive plymouth/LLCM-logo/ $FS/usr/share/plymouth/themes/
################################################################################################################

################################################################################################################
# Screen Saver - XScreenSaver
sudo cp screensaver/XScreenSaver $FS/usr/lib/X11/app-defaults/
################################################################################################################

################################################################################################################
# Login - sddm
sudo cp --recursive sddm/lubuntu/ $FS/usr/share/sddm/themes/
################################################################################################################

################################################################################################################
# isolinux boot splash
# cpio -i < bootlogo
# cat bootlogo | cpio -t > list
# cpio -o < list > bootlogo
sudo rm --recursive $CD/isolinux
cp --recursive isolinux $CD
################################################################################################################

################################################################################################################
# Calamares
sudo rm --recursive $FS/etc/calamares/branding/lubuntu/
sudo cp --recursive calamares/LLCM $FS/etc/calamares/branding/

sudo cp --recursive calamares/modules $FS/etc/calamares
sudo cp calamares/settings.conf $FS/etc/calamares/

sudo rm $FS/usr/share/applications/lubuntu-calamares.desktop
sudo cp calamares/lubuntu-calamares.desktop $FS/usr/share/applications

sudo cp calamares/calamares-logs-helper $FS/usr/bin/
sudo cp calamares/calamares-logs-helper $FS/bin/
################################################################################################################

################################################################################################################
# Grub
#cp grub/grub.cfg /home/adriano/LLCM/LLCM/custom-disk//boot/grub
cp grub/grub.cfg $CD/boot/grub
cp grub/loopback.cfg $CD/boot/grub
rm $CD/preseed/lubuntu.seed
cp grub/llcm.seed $CD/preseed
################################################################################################################

################################################################################################################
# Script to run inside chroot
echo "Copy script to run inside chroot. Execute:"
echo "cd /home && sudo chmod +x ./run_inside_chroot.sh && ./run_inside_chroot.sh"
sudo cp run_inside_chroot.sh $FS/home/
################################################################################################################