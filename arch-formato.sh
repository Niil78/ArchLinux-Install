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
sleep 5
clear
echo -e 'ejecutando instalacion base'
chmod +x arch-instalacion.sh
sh arch-instalacion.sh
