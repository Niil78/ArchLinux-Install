#################################
## ARCH - LINUX BY:NIIL78       #
#################################
echo -e '{Bold}Bienvenido a la instalacion intectiva'
echo -e '{Bold}By:Niil78'
echo -e 'Tienes que estar conectado a internet'
echo -e 'vamos a abrir los mirrors y pacman, por si tenemos que hacer cambios'
echo -e 'Default \e[92mdeberias tener un espejo arriba cercano'
sleep 5
nano /etc/pacman.conf
nano /etc/pacman.d/mirrorlist
echo -e 'Default \e[92mConfirmamos version EFI'
ls /sys/firmware/efi/efivars
sleep 3
loadkeys es
KEY_MAP="es"
clear
echo -e 'Default \e[92mPoniendo la hora'
timedatectl set-ntp true
timedatectl status
sleep 3
clear
echo -e 'Default \e[92mListamos los discos duros'
lsblk
sleep 3
echo -e 'Formateando todas las particiones'
sleep 1
mkfs.fat -F32 /dev/sda1
echo -e 'Default \e[92m/boot - formateado'
sleep 2
mkswap /dev/sda2
echo -e 'Default \e[92m/swap - formateado'
sleep 2
swapon /dev/sda2
echo -e 'Default \e[92m/SWAP ON'
sleep 2
mkfs.ext4 /dev/sda3
echo -e 'Default \e[92m/root - formateado'
mkfs.ext4 /dev/sda4
echo -e 'Default \e[92m/home - formateado'
echo -e 'Default \e[92mFormatos listos'
echo -e 'Default \e[92mMontando particiones'
sleep 2
mount /dev/sda3 /mnt
echo -e 'Default \e[92m/root - listo'
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
echo -e 'Default \e[92m/boot - listo'
mkdir -p /mnt/home
mount /dev/sda4 /mnt/home
echo -e 'Default \e[92m/home - listo'
echo -e 'recordamos que SWAP ya fue marcado ON'
sleep 3
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
