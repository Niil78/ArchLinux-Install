echo -e 'Formateando todas las particiones'
mkfs.fat -F32 /dev/sda1
echo -e '/boot - formateado'
mkswap /dev/sda2
echo -e '/swap - formateado'
swapon /dev/sda2
echo -e '/SWAP ON'
mkfs.ext4 /dev/sda3
echo -e '/root - formateado'
mkfs.ext4 /dev/sda4
echo -e '/home - formateado'
echo -e 'Formatos listos'
echo -e 'montando particiones'
mount /dev/sda3 /mnt
echo -e '/root - listo'
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
echo -e '/boot - listo'
mkdir -p /mnt/home
mount /dev/sda4 /mnt/home
echo -e '/home - listo'
echo -e 'recordamos que SWAP ya fue marcado ON'
sleep 5
clear
echo -e 'ejecutando instalacion base'
chmod +x arch-instalacion.sh
sh arch-instalacion.sh
