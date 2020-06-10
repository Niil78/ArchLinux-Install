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
echo -e '\e[92mVamos a crear un usuario, Nombre?:\e[0m'
read user
useradd -m $user
passwd $user
echo -e '\e[91mContraseña root\e[0m'
passwd
echo -e '\e[91mConfiguracion basica minima lista\e[0m'
# Nvdia Drivers
wget http://es.download.nvidia.com/XFree86/Linux-x86_64/430.26/NVIDIA-Linux-x86_64-430.26.run
chmod +x NVIDIA-Linux-x86_64-430.26.run
./NVIDIA-Linux-x86_64-430.26.run
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
exit 
chmod +x Fin.sh
sh Fin.sh
sleep 1
reboot
