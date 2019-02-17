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
#
#KDE - PLASMA - INSTALACION
#
echo -e 'Instalando Plasma :D'
chmod +x Aplicaciones/app-kdeplasma.sh
sh root/Aplicaciones/app-kdeplasma.sh
clear
#
#APP BASICAS
#
echo  -e 'Aplicaciones Basicas'
chmod +x Aplicaciones/app_basicas.sh
sh Aplicaciones/app_basicas.sh
clear
#
#GESTORES
#
echo -e 'Gestores'
chmod +x Aplicaciones/app_gestores.sh
sh Aplicaciones/app_gestores.sh
clear
#
# Aplicaciones
#
echo -e 'ahora tocan las herramientas, esto puede tardar un poco bastante.'
echo -e 'corre a por un cargador para el portatil por si fuera necesario.'
echo -e 'esto puede tardar algunas horas en terminar'
sleep 3
chmod +x Gestores/yay-app.sh
sh Gestores/yay-app.sh
echo -e 'Hemos terminado con Yay. Ahora toca Pakku'
sleep 2
chmod +x Aplicaciones/pakku-app.shh
sh root/Aplicaciones/pakku-app.sh
echo -e 'Pakku a terminado.'
echo -e 'Finalizado'
#Al salir continua el script no toques nada
echo -e 'Al salir continua el script no toques nada'
echo -e 'espera 5 segundos mas'
sleep 5
echo -e '¡Rocket Launch!'
#Al salir continua el script no toques nada
exit
