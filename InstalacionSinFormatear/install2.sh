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
echo -e 'Default \e[91mCreando un Usuario\e[0m'
echo -e '\e[92mPor defecto voy a crear a pepe\e[0m'
useradd -m niil
passwd niil
echo -e 'Default \e[91mContraseña root\e[0m'
passwd
echo -e 'Default \e[91mConfiguracion basica minima lista\e[0m'
#KDE - Plasma
pacman -Syu --noconfirm plasma plasma-meta sddm
systemctl enable sddm
#Desmontar y preparar para finalizar
exit #salimos de la particion DONDE Instalamos el SO
echo -e 'Desmontando todas las particiones y reinciando'
sleep 1
lsblk
umount -R /mnt
lsblk
swapoff /dev/sda2
echo -e 'el swap tambien'
chmod +x Finalizar
sh Finalizar.sh
sleep 1
reboot
