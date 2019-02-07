echo -e 'comenzamos proceso instalacion y configuracion basica'
sleep 2
pacstrap /mnt
echo -e 'Generar fstab'
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
clear
echo -e 'ahora pasara a root en su version instalada'
echo -e 'ahora tiene que: chmod +x instalacion2.sh.
echo -e 'la instalacion continuara con normalidad'
sleep 5
mv parte2.sh /mnt
echo -e 'Bienvenido a tu pequeña instalacion'
arch-chroot /mnt /bin/bash 
