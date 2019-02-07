tzselect
pacman -Syu grub efibootmgr iw wpa_supplicant dialog sudo
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg
echo NStation > /etc/hostname
#
#USUARIO
#
echo -e 'Default \e[91mCreando un Usuario'
useradd -m pepe
passwd pepe
echo -e 'Default \e[91mContraseña root'
passwd
echo -e 'Default \e[91mConfiguracion basica minima lista'
#
#KDE - PLASMA - INSTALACION
#
chmod +x KDE.sh
sh KDE.sh
#Al salir continua el script no toques nada
exit
