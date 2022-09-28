echo -e 'Uncomment the line of your keyboard layout.'
nano /etc/locale.gen
locale-gen
sleep 3
echo -e "Select your hourly usage."
tzselect 

pacman -Syyu archlinux-keyring 
pacman -S grub efibootmgr iw wpa_supplicant dialog sudo
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg

echo -e "Name your computer (hostname)"
read Hostname
echo $Hostname > /etc/hostname

echo -e "Creation of a user."
echo -e "What do you want your user to be called?"
read user
useradd -m $user
echo -e "What password do you want?"
passwd $user
echo -e "Let's change the password for the root user. What password do you want?"
passwd

pacman -Syu --noconfirm  wireless_tools iw wpa_supplicant iwd dhcpcd
systemctl enable dhcpcd

echo -e "The installation is complete. Remember to install a window manager."
echo -e "You can continue to configure the operating system using the scripts in the Extras folder. (ArchLinux-install/Extras)"