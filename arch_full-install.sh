tzselect
pacman -Syu grub efibootmgr iw wpa_supplicant dialog sudo
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg
echo NStation > /etc/hostname
#
#USUARIO
#
echo -e 'Default \e[91mCreando un Usuario'
echo -e 'Por defecto voy a crear a pepe'
useradd -m pepe
echo -e 'Default \e[91mContraseña root'
passwd
echo -e 'Passwd para pepe'
passwd pepe
echo -e 'Default \e[91mConfiguracion basica minima lista'
echo -e 'Pero esto continua'
#
#KDE - PLASMA - INSTALACION
#
echo -e 'Instalando Plasma :D'
chmod +x Aplicaciones.sh
sh Aplicaciones.sh
clear

echo -e 'ahora tocan las herramientas, esto puede tardar un poco bastante.'
echo -e 'corre a por un cargador para el portatil por si fuera necesario.'
echo -e 'esto puede tardar algunas horas en terminar.'
sleep 3
chmod +x Gestores.sh
sh Gestores.sh
echo -e 'Finalizado'
#Al salir continua el script no toques nada
echo -e 'ejecuta finalizar.sh'
sleep 5
echo -e '¡Rocket Launch!'
#Al salir continua el script no toques nada
exit
