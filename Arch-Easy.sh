#################################
## ARCH - LINUX BY:NIIL78       #
#################################
echo -e 'tienes que estar comnectado a internet.'
echo -e 'vamos a abrir los mirrors y pacman, por si tenemos que hacer cambios'
sleep 10
nano /etc/pacman.conf
nano /etc/pacman.d/mirrorlist
echo -e 'Efivars'
ls /sys/firmware/efi/efivars
sleep 5
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
