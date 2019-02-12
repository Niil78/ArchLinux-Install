#################################
## ARCH - LINUX BY:NIIL78       #
#################################
echo -e '{Bold}Bienvenido a la instalacion intectiva'
echo -e '{Bold}By:Niil78'
echo -e 'Tienes que estar conectado a internet'
sleep 1
echo -e 'vamos a abrir los mirrors y pacman, por si tenemos que hacer cambios'
echo -e 'Default \e[92mdeberias tener un espejo arriba cercano'
sleep 5
nano /etc/pacman.conf
nano /etc/pacman.d/mirrorlist
echo -e 'Default \e[92mConfirmamos version EFI'
ls /sys/firmware/efi/efivars
sleep 5
loadkeys es
KEY_MAP="es"
clear
echo -e 'Default \e[92mPoniendo la hora'
timedatectl set-ntp true
timedatectl status
sleep 5
clear
echo -e 'Default \e[92mListamos los discos duros'
lsblk
echo -e 'ejecutando particiones'
chmod +x Arch-Facil/arch-particiones.sh
sh Arch-Arch_Facil/arch-particiones.sh
