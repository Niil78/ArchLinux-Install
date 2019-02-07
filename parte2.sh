tzselect
pacman -Syu grub efibootmgr iw wpa_supplicant dialog sudo
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg
echo NStation > /etc/hostname
useradd -m pepe
passwd
echo -e 'configuracion basica minima lista'
exit
umount -R /mnt
swapoff /dev/sda2
reboot
