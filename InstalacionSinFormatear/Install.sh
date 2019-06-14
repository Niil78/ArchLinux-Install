#################################
## ARCH - LINUX BY:NIIL78       #
#################################
echo -e '\e[0;31{Bold}Bienvenido a la instalacion intectiva\e[0m'
echo -e '\e[0;31{Bold}By:Niil78\e[0m'
echo -e '\e[0;31Tienes que estar conectado a internet\e[0m'
echo -e '\e[0;31vamos a abrir los mirrors y pacman, por si tenemos que hacer cambios\e[0m'
echo -e '\e[0;31deberias tener un espejo arriba cercano\e[0m'
echo -e '\e[0;31EN ESTA INSTALACION NO SE CREARAN LAS PARTICIONES\e[0m'
echo -e '\e[0;31EN ESTA INSTALACION NO SE CREARAN LAS PARTICIONES\e[0m'
echo -e '\e[0;31EN ESTA INSTALACION NO SE CREARAN LAS PARTICIONES\e[0m'
sleep 5
timedatectl set-ntp true
timedatectl status
sleep 2
nano /etc/pacman.conf
nano /etc/pacman.d/mirrorlist
echo -e 'Default \e[92mConfirmamos version EFI\e[0m'
ls /sys/firmware/efi/efivars
sleep 1
loadkeys es
KEY_MAP="es"
clear
echo -e 'Default \e[92mPoniendo la hora\e[0m'
timedatectl set-ntp true
timedatectl status
sleep 1
clear
echo -e 'Default \e[92mListamos los discos duros\e[0m'
lsblk
echo -e '\e[92Formateando TODAS las particiones\e[0m'
sleep 1
mkfs.fat -F32 /dev/sda1
echo -e 'Default \e[92m/boot - formateado'
mkswap /dev/sda2
echo -e 'Default \e[92m/swap - formateado'
swapon /dev/sda2
echo -e 'Default \e[92m/SWAP ON'
mkfs.ext4 /dev/sda3
echo -e 'Default \e[92m/root - formateado'
mkfs.ext4 /dev/sda4
echo -e 'Default \e[92m/home - formateado'
echo -e 'Default \e[92mFormatos listos'
echo -e 'Default \e[92mMontando particiones'
mount /dev/sda3 /mnt
echo -e 'Default \e[92m/root - listo'
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
echo -e 'Default \e[92m/boot - listo'
mkdir -p /mnt/home
mount /dev/sda4 /mnt/home
echo -e 'Default \e[92m/home - listo'
echo -e 'recordamos que SWAP ya fue marcado ON'
#Iniciar instalacion base
echo -e 'Si este programa se para tras unos instantes y apareces logeado como root'
echo -e 'Entonces tu instalacion esta apunto de terminar. unicamente deberas ejecutar install-2.sh'
sleep 5
chmod +x install2.sh
mv install2.sh /mnt
pacstrap /mnt
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
arch-chroot /mnt /bin/bash

#################################################
## Configuracion del S.O Basico
################################################
nano /etc/locale.gen
locale-gen
echo -e 'LANG=en_US.UTF-8'
sleep 3
tzselect #Para configurar el Relog
pacman -Syu grub efibootmgr iw wpa_supplicant dialog sudo
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg
## Instalacion del GRUB & configuracion BASE.
echo NStation > /etc/hostname
##Marcamos la maquina como NStation(PuedeCambiarse)
### Creacion de usuario SIN PERMISOS ROOT.
echo -e 'Default \e[91mCreando un Usuario\e[0m'
echo -e '\e[92mPor defecto voy a crear a pepe\e[0m'
useradd -m niil
passwd niil
echo -e 'Default \e[91mContraseña root\e[0m'
passwd
echo -e 'Default \e[91mConfiguracion basica minima lista\e[0m'
#KDE - Plasma
pacman -Syu --noconfirm plasma plasma-meta sddm
systemctl enable sddm
#Desmontar y preparar para finalizar
exit #salimos de la particion DONDE Instalamos el SO
echo -e 'Desmontando todas las particiones y reinciando'
sleep 1
lsblk
umount -R /mnt
lsblk
swapoff /dev/sda2
echo -e 'el swap tambien'
chmod +x Finalizar
sh Finalizar.sh
sleep 1
reboot
