#################################
## ARCH - LINUX BY:NIIL78  2019 #
#################################
echo -e '\e[92m{Bold}Bienvenido a la instalacion intectiva\e[0m'
echo -e '\e[92m{Bold}By:Niil78\e[0m'
echo -e '\e[92mTienes que estar conectado a internet\e[0m'
echo -e '\e[92mVamos a abrir los mirrors y pacman, por si tenemos que hacer cambios\e[0m'
echo -e '\e[92mDeberias tener un espejo arriba cercano\e[0m'
echo -e '\e[92mEN ESTA INSTALACION NO SE CREARAN LAS PARTICIONES\e[0m'
echo -e '\e[92mEN ESTA INSTALACION NO SE CREARAN LAS PARTICIONES\e[0m'
echo -e '\e[92mEN ESTA INSTALACION NO SE CREARAN LAS PARTICIONES\e[0m'
sleep 5
timedatectl set-ntp true
timedatectl status
sleep 2
nano /etc/pacman.conf
mv mirrors /etc/pacman.d/mirrorlist
echo -e 'mirrors sustituidas'
nano /etc/pacman.d/mirrorlist
echo -e '\e[92mConfirmamos version EFI\e[0m'
ls /sys/firmware/efi/efivars
sleep 1
loadkeys es
KEY_MAP="es"
clear
echo -e '\e[92mPoniendo la hora\e[0m'
timedatectl set-ntp true
timedatectl status
sleep 1
clear
echo -e '\e[92mListamos los discos duros\e[0m'
lsblk
pause 2
############################
###VARIABLE v0.01###########
#########BOOT###############
clear
echo "Selecciona una particion como boot)"
read boot
echo "Seleccionado como  $boot..."
############################

############################
###VARIABLE v0.01###########
#########SWAP###############
clear
echo "Selecciona una particion como swap"
read swap
echo "Seleccionado como  $swap..."
############################

############################
###VARIABLE v0.01###########
#########ROOT###############
clear
echo "Selecciona una particion como root"
read root
echo "Seleccionado como  $root..."
############################

############################
###VARIABLE v0.01###########
#########HOME###############
clear
echo "Selecciona una particion como home"
read home
echo "Seleccionado como  $home..."
############################

echo -e '\e[92Formateando TODAS las particiones\e[0m'
sleep 1
mkfs.fat -F32 $boot
echo -e '\e[92m/boot - formateado\e[0m'
mkswap $swap
echo -e '\e[92m/swap - formateado\e[0m'
swapon $swap
echo -e '\e[92m/SWAP ON\e[0m'
mkfs.ext4 $root
echo -e '\e[92m/root - formateado\e[0m'
mkfs.ext4 $home
echo -e '\e[92m/home - formateado\e[0m'
echo -e '\e[92mFormatos listos\e[0m'
echo -e '\e[92mMontando particiones\e[0m'
mount $root /mnt
echo -e '\e[92m/root - listo\e[0m'
mkdir -p /mnt/boot
mount $boot /mnt/boot
echo -e '\e[92m/boot - listo\e[0m'
mkdir -p /mnt/home
mount $home /mnt/home
echo -e '\e[92m/home - listo\e[0m'
echo -e '\e[92mrecordamos que SWAP ya fue marcado ON\e[0m'
#Iniciar instalacion base
echo -e '\e[92mSi este programa se para tras unos instantes y apareces logeado como root\e[0m'
echo -e '\e[92mEntonces tu instalacion esta apunto de terminar. unicamente deberas ejecutar install-2.sh\e[0m'
sleep 5
pacstrap /mnt
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
chmod +x /mnt/install2.sh
cp install2.sh /mnt
arch-chroot /mnt /bin/bash

# #################################################
# ## Configuracion del S.O Basico
# ################################################
# nano /etc/locale.gen
# locale-gen
# echo -e 'LANG=en_US.UTF-8'
# sleep 3
# tzselect #Para configurar el Relog
# pacman -Syu grub efibootmgr iw wpa_supplicant dialog sudo
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux
# grub-mkconfig -o /boot/grub/grub.cfg
# ## Instalacion del GRUB & configuracion BASE.
# echo NStation > /etc/hostname
# ##Marcamos la maquina como NStation(PuedeCambiarse)
# ### Creacion de usuario SIN PERMISOS ROOT.
# echo -e '\e[91mCreando un Usuario\e[0m'
# echo -e '\e[92mPor defecto voy a crear a Niil\e[0m'
# useradd -m niil
# passwd niil
# echo -e '\e[91mContraseña root\e[0m'
# passwd
# echo -e '\e[91mConfiguracion basica minima lista\e[0m'
# #KDE - Plasma
# pacman -Syu --noconfirm plasma plasma-meta sddm
# systemctl enable sddm
# #Desmontar y preparar para finalizar
# exit #salimos de la particion DONDE Instalamos el SO
# echo -e '\e[92mDesmontando todas las particiones y reinciando\e[0m'
# sleep 1
# lsblk
# umount -R /mnt
# lsblk
# swapoff /dev/sda2
# echo -e '\e[92mel swap tambien\e[0m'
# chmod +x Fin.sh
# sh Fin.sh
# sleep 1
# reboot
