#################################
## ARCH - LINUX BY:NIIL78       #
#################################
echo -e '{Bold}Bienvenido a la instalacion intectiva'
echo -e '{Bold}By:Niil78'
echo -e 'Tienes que estar conectado a internet'
sleep 1
echo -e 'vamos a abrir los mirrors y pacman, por si tenemos que hacer cambios'
echo -e 'deberias tener un espejo arriba cercano'
sleep 5
nano /etc/pacman.conf
nano /etc/pacman.d/mirrorlist
echo -e 'Confirmamos version EFI'
ls /sys/firmware/efi/efivars
sleep 5
clear
echo -e 'Poniendo la hora'
timedatectl set-ntp true
timedatectl status
sleep 5
clear
echo -e 'Listamos los discos duros'
lsblk
echo -e 'ejecutando particiones'
chmod +x arch-particiones.sh
sh arch-particiones.sh
