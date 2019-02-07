echo -e 'comenzamos proceso instalacion y configuracion basica'
sleep 2
pacstrap /mnt
echo -e 'Generar fstab'
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
clear
echo -e 'ahora pasara a root en su version instalada'
echo -e 'ahora tiene que: chmod +x instalacion2.sh.
echo -e 'Default \e[91mLa instalacion continuara con normalidad'
sleep 5
mv instalacion2.sh /mnt
echo -e 'Default \e[91mBienvenido a tu pequeña instalacion'
arch-chroot /mnt /bin/bash 
#
#
#
echo -e 'Holiiiii, Yo me encargo'
sleep 1
lsblk
umount -R /mnt
lsblk
swapoff /dev/sda2
echo -e 'el swap tambien'
sleep 2
reboot
