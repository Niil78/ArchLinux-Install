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
echo -e 'Instalando Plasma :D'
chmod +x app-kdeplasma.sh
sh app-kdeplasma.sh
clear
echo  -e 'Aplicaciones Basicas'
echo -e app_basicas.sh
chmod +x app_basicas.sh
sh app_basicas.sh
clear
echo -e 'Gestores'
echo -e app_gestores.sh
chmod +x app_gestores.sh
sh app_gestores.sh
clear
echo -e 'Finalizado'
#Al salir continua el script no toques nada
echo -e 'Al salir continua el script no toques nada'
sleep1
#Al salir continua el script no toques nada
exit
