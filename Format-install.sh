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
