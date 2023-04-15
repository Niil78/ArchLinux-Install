
echo -e 'This application installs the operating system. After finishing it will chroot your new operating system and you will have to continue the installation with the Install-ArchLinux2.sh package.'
sleep 5
pacman -S archlinux-keyring
clear

pacstrap /mnt base linux linux-headers linux-zen linux-zen-headers linux-firmware 
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
sleep 1
echo -e "Continue the installation with the Install-ArchLinux2.sh package."
mv Install-ArchLinux2.sh /mnt/
chmod +x /mnt/Install-ArchLinux2.sh
mv ../EXTRAS/ /mnt/
sleep 5
arch-chroot /mnt /bin/bash
