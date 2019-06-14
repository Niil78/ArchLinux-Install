tzselect
pacman -Syu grub efibootmgr iw wpa_supplicant dialog sudo
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg
echo NStation > /etc/hostname
#
#USUARIO
#
echo -e 'Default \e[91mCreando un Usuario\e[0m'
echo -e '\e[92mPor defecto voy a crear a pepe\e[0m'
useradd -m niil
passwd niil78
echo -e 'Default \e[91mContraseña root\e[0m'
passwd
echo -e 'Default \e[91mConfiguracion basica minima lista\e[0m'
#
#KDE - PLASMA - INSTALACION
#
chmod +x Aplicaciones.sh
sh Aplicaciones.sh
#Al salir continua el script no toques nada
echo -e 'ejecuta finalizar.sh'
exit
