#################################
## ARCH - LINUX BY:NIIL78       #
#################################

# Definir colores
GREEN='\e[92m'
RED='\e[91m'
BLUE='\e[94m'
RESET='\e[0m'

# Mensaje de inicio
echo -e "${GREEN} ArchLinux Installer"
echo -e "${GREEN} By: Niil78${RESET}"
sleep 2

# Explicación del proceso
echo -e "${GREEN} Este script creará particiones, las formateará, montará y procederá con la instalación de Arch Linux.${RESET}"
sleep 2

# Selección de disco principal
echo -e "${GREEN} Selecciona un disco para particionar ${RESET}"
lsblk
read -p "Introduce la dirección completa del disco (ejemplo: /dev/sda): " disk
clear

# Creación de particiones
echo -e "${GREEN} Creando particiones en $disk ${RESET}"
parted --script $disk mklabel gpt

# BOOT
read -p "Introduce el tamaño de la partición BOOT (ejemplo: 512MB): " boot_size
parted --script $disk mkpart ESP fat32 1MiB ${boot_size}
parted --script $disk set 1 esp on

# ROOT
read -p "Introduce el tamaño de la partición ROOT (ejemplo: 20GB): " root_size
parted --script $disk mkpart primary ext4 ${boot_size} ${root_size}

# HOME
read -p "Introduce el tamaño de la partición HOME (dejar vacío para usar todo el espacio restante): " home_size
if [[ -z "$home_size" ]]; then
    parted --script $disk mkpart primary ext4 ${root_size} 100%
else
    parted --script $disk mkpart primary ext4 ${root_size} ${home_size}
fi

# Mostrar particiones creadas
echo -e "${GREEN} Particiones creadas:${RESET}"
lsblk $disk

# Confirmación antes de formatear
read -p "Presiona Enter para formatear las particiones o Ctrl+C para abortar."

# Obtener nombres de particiones
boot_part=${disk}1
root_part=${disk}2
home_part=${disk}3

# Formateo de particiones
echo -e "${GREEN} Formateando particiones...${RESET}"
mkfs.fat -F32 $boot_part
echo -e "${GREEN} BOOT formateado.${RESET}"
mkfs.ext4 $root_part
echo -e "${GREEN} ROOT formateado.${RESET}"
read -p "¿Quieres formatear HOME? (s/n): " format_home
if [[ "$format_home" == "s" ]]; then
    mkfs.ext4 $home_part
    echo -e "${GREEN} HOME formateado.${RESET}"
fi

# Montaje de particiones
echo -e "${GREEN} Montando particiones...${RESET}"
mount $root_part /mnt
mkdir -p /mnt/boot
mount $boot_part /mnt/boot
mkdir -p /mnt/home
mount $home_part /mnt/home

echo -e "${GREEN} Particiones montadas.${RESET}"

# Configurar Zram
echo -e "${GREEN} Configurando ZRAM...${RESET}"
modprobe zram
echo lz4 > /sys/block/zram0/comp_algorithm
echo $(($(getconf _PHYS_PAGES) * 75 / 100)) > /sys/block/zram0/disksize
mkswap /dev/zram0
swapon /dev/zram0

echo -e "${GREEN} ZRAM configurado.${RESET}"

# Instalación del sistema base
echo -e "${GREEN} Instalando el sistema base...${RESET}"
pacman -Sy --noconfirm archlinux-keyring
pacstrap /mnt base linux linux-headers linux-zen linux-zen-headers linux-firmware sudo nano zsh vim networkmanager network-manager-applet

# Generar fstab
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
sleep 1

# Preparar chroot
echo -e "${GREEN} Preparando el sistema para chroot...${RESET}"
mv Install-ArchLinux2.sh /mnt/
chmod +x /mnt/Install-ArchLinux2.sh
mv ../EXTRAS/ /mnt/
sleep 5
arch-chroot /mnt /bin/bash <<EOF

# Configuración básica dentro de chroot
echo -e "Descomentar la configuración del teclado"
nano /etc/locale.gen
locale-gen
sleep 3
echo -e "Selecciona tu zona horaria."
tzselect

# Instalar paquetes esenciales
pacman -Syyu --noconfirm archlinux-keyring grub efibootmgr iw wpa_supplicant dialog sudo

# Instalar y configurar Zsh y Oh My Zsh
pacman -S --noconfirm zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="robbyrussell"/' ~/.zshrc
echo "plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)" >> ~/.zshrc

# Configurar GRUB
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg

# Configurar nombre de host
echo -e "Introduce el nombre de tu equipo:"
read Hostname
echo $Hostname > /etc/hostname

# Crear usuario
echo -e "Introduce el nombre de tu usuario:"
read user
useradd -m -s /bin/zsh $user
echo -e "Introduce una contraseña para $user:"
passwd $user
echo -e "Configurar contraseña para root:"
passwd

# Configurar red
pacman -Syu --noconfirm networkmanager network-manager-applet
systemctl enable NetworkManager

EOF

echo -e "${GREEN} Instalación completada. Puedes continuar configurando el sistema usando los scripts en la carpeta Extras.${RESET}"
