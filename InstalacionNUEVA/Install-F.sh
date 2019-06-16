#################################
## ARCH - LINUX BY:NIIL78       #
#################################
echo -e '\e[92m{Bold}Bienvenido a la instalacion intectiva\e[0m'
echo -e '\e[92m{Bold}By:Niil78\e[0m'
echo -e '\e[92mTienes que estar conectado a internet\e[0m'
echo -e '\e[92mVamos a abrir los mirrors y pacman, por si tenemos que hacer cambios\e[0m'
echo -e '\e[92mDeberias tener un espejo arriba cercano\e[0m'
# Configuracion basica para iniciar la configuracion del sistema
sleep 5
timedatectl set-ntp true
timedatectl status
sleep 2
nano /etc/pacman.conf
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
# Crear particiones nuevas
read -p '\e[91mLlego la hora de particionar\e[0m'
echo -e '/dev/sda[120GB]'
echo -e '/dev/sda -> /boot[512M]'
echo -e '/dev/sda -> /swap[4G]'
echo -e '/dev/sda -> /root[50G]'
echo -e '/dev/sda -> /Home[resto]'
sleep 1
echo -e 'n (Crea una nueva partición)'
echo -e 'Dejar número de la partición por defecto, presionando ENTER'
echo -e 'Dejar por defecto el sector inicial, presionando ENTER'
echo -e 'Para el sector final, escribir +TAMAÑO y presionar ENTER'
echo -e 'Escribir TIPO cuando se pida código de partición y luego ENTER'
echo -e 'w (Para escribir los cambios y luego ENTER)'
echo -e 'y (Para aceptar los cambios y luego ENTER)'
sleep 3
echo -e 'Crear particion GPT'
echo -e 'Pulsa estas teclas O-Y-W-Y para crear una particon GPT'
gdisk /dev/sda
sleep 1
clear
echo -e '\e[91m 1º particion /boot[512M] TIPO: EF00 /> N ENTER ENTER +512M EF00 W Y\e[0m'
gdisk /dev/sda
clear
echo -e '\e[91m 2º particion /swap[4G] TIPO: 8200 /> N ENTER ENTER +4G 8200 W Y\e[0m'
gdisk /dev/sda
clear
echo -e '\e[91m 3º particion /root[50G] TIPO: 8304  /> N ENTER ENTER +50G 8304 W Y\e[0m'
gdisk /dev/sda
clear
echo -e '\e[91m 4º particion /home TIPO: 8302 /> N ENTER ENTER ENTER 8302 W Y\e[0m'
gdisk /dev/sda
clear
echo -e '\e[92mListo Particionado finalizado\e[0m'

# FORMATEAR PARTICIONES
echo -e '\e[92Formateando TODAS las particiones\e[0m'
sleep 1
mkfs.fat -F32 /dev/sda1
echo -e '\e[92m/boot - formateado\e[0m'
mkswap /dev/sda2
echo -e '\e[92m/swap - formateado\e[0m'
swapon /dev/sda2
echo -e '\e[92m/SWAP ON\e[0m'
mkfs.ext4 /dev/sda3
echo -e '\e[92m/root - formateado\e[0m'
mkfs.ext4 /dev/sda4
echo -e '\e[92m/home - formateado\e[0m'
echo -e '\e[92mFormatos listos\e[0m'
echo -e '\e[92mMontando particiones\e[0m'
mount /dev/sda3 /mnt
echo -e '\e[92m/root - listo\e[0m'
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
echo -e '\e[92m/boot - listo\e[0m'
mkdir -p /mnt/home
mount /dev/sda4 /mnt/home
echo -e '\e[92m/home - listo\e[0m'
echo -e '\e[92mrecordamos que SWAP ya fue marcado ON\e[0m'
#Iniciar instalacion base
echo -e '\e[92mSi este programa se para tras unos instantes y apareces logeado como root\e[0m'
echo -e '\e[92mEntonces tu instalacion esta apunto de terminar. unicamente deberas ejecutar install-2.sh\e[0m'
sleep 5
chmod +x install2.sh # Movemos y damos permisos para ejecutar esto en caso necesario.
mv install2.sh /mnt  # Movemos y damos permisos para ejecutar esto en caso necesario.
pacstrap /mnt        # Descarga el sistema base y la instala.
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
echo -e '\e[91mCreando un Usuario\e[0m'
echo -e '\e[92mPor defecto voy a crear a niil\e[0m'
useradd -m niil
passwd niil
echo -e '\e[91mContraseña root\e[0m'
passwd
echo -e '\e[91mConfiguracion basica minima lista\e[0m'
#KDE - Plasma
pacman -Syu --noconfirm plasma plasma-meta sddm
systemctl enable sddm
#Desmontar y preparar para finalizar
exit #salimos de la particion DONDE Instalamos el SO
echo -e '\e[92mDesmontando todas las particiones y reinciando\e[0m'
sleep 1
lsblk
umount -R /mnt
lsblk
swapoff /dev/sda2
echo -e '\e[92mel swap tambien\e[0m'
chmod +x Fin.sh
sh Fin.sh
sleep 1
reboot
