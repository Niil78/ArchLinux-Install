#################################
## ARCH - LINUX BY:NIIL78       #
#################################
echo -e '{Bold}Bienvenido a la instalacion intectiva'
echo -e '{Bold}By:Niil78'
echo -e 'Tienes que estar conectado a internet'
echo -e 'vamos a abrir los mirrors y pacman, por si tenemos que hacer cambios'
echo -e 'Default \e[92mdeberias tener un espejo arriba cercano'
sleep 2
nano /etc/pacman.conf
nano /etc/pacman.d/mirrorlist
echo -e 'Default \e[92mConfirmamos version EFI'
ls /sys/firmware/efi/efivars
sleep 1
loadkeys es
KEY_MAP="es"
clear
echo -e 'Default \e[92mPoniendo la hora'
timedatectl set-ntp true
timedatectl status
sleep 1
clear
echo -e 'Default \e[92mListamos los discos duros'
lsblk
echo -e 'ejecutando particiones'
sleep 1
clear
## chmod +x arch-particiones.sh
## sh arch-particiones.sh
echo -e 'Llego la hora de particionar'
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
echo -e 'Default \e[91m 1º particion /boot[512M] TIPO: EF00 /> N ENTER ENTER +512M EF00 W Y'
gdisk /dev/sda
clear
echo -e 'Default \e[91m 2º particion /swap[4G] TIPO: 8200 /> N ENTER ENTER +4G 8200 W Y '
gdisk /dev/sda
clear
echo -e 'Default \e[91m 3º particion /root[50G] TIPO: 8304  /> N ENTER ENTER +50G 8304 W Y'
gdisk /dev/sda
clear
echo -e 'Default \e[91m 4º particion /home TIPO: 8302 /> N ENTER ENTER ENTER 8302 W Y'
gdisk /dev/sda
clear
echo -e 'Default \e[92mListo Particionado finalizado'
lsblk
echo -e 'Default \e[92m Ejecutando formato'
## chmod +x arch-formato.sh
## sh arch-formato.sh
sleep 1
clear
echo -e 'Formateando todas las particiones'
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
sleep 2
clear
echo -e 'ejecutando instalacion base'
#chmod +x arch-instalacion.sh
sleep 1
## sh arch-instalacion.sh
echo -e 'comenzamos proceso instalacion y configuracion basica'
sleep 2
pacstrap /mnt
echo -e 'Generar fstab'
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
clear
echo -e 'ahora pasara a root en su version instalada'
echo -e 'ahora tiene que: chmod +x instalacion2.sh'
echo -e 'Default \e[91mLa instalacion continuara con normalidad'
sleep 2
mv arch_basic-install.sh /mnt
mv arch_full-install.sh /mnt
echo -e 'Recuerda darle permisos chmod +x al script'
echo -e 'Default \e[91mBienvenido a tu pequeña instalacion'
arch-chroot /mnt /bin/bash
sleep 2
