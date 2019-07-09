echo -e 'Desmontando todas las particiones y reinciando'
sleep 1
lsblk
umount -R /mnt
lsblk
swapoff $swap
echo -e 'el swap tambien'
sleep 1
reboot
