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
echo -e "${GREEN} Este script instalará i3wm, Plasma minimal y herramientas esenciales.${RESET}"
sleep 2

# Instalación de sudo y configuración de permisos
echo -e "${GREEN} Instalando y configurando sudo...${RESET}"
pacman -S --noconfirm --needed sudo
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Creación del usuario y adición al grupo wheel
echo -e "${GREEN} Introduce el nombre de usuario: ${RESET}"
read USERNAME
if id "$USERNAME" &>/dev/null; then
    echo -e "${GREEN} El usuario $USERNAME ya existe. ¿Quieres cambiar su contraseña? (s/n)${RESET}"
    read CHANGE_PASS
    if [[ "$CHANGE_PASS" == "s" ]]; then
        passwd "$USERNAME"
    fi
else
    echo -e "${GREEN} Creando usuario $USERNAME y agregándolo al grupo wheel...${RESET}"
    useradd -m -G wheel -s /bin/bash "$USERNAME"
    passwd "$USERNAME"
fi

# Instalación de PARU
echo -e "${GREEN} Instalando PARU (AUR Helper)...${RESET}"
pacman -S --noconfirm --needed base-devel git
cd /opt
sudo git clone https://aur.archlinux.org/paru.git
sudo chown -R $(whoami):$(whoami) paru
cd paru
makepkg -si --noconfirm
cd ~

# Instalación de paquetes esenciales
echo -e "${GREEN} Instalando paquetes esenciales...${RESET}"
pacman -S --noconfirm i3 i3status dmenu xorg xorg-xinit xorg-server \
    plasma-desktop sddm kvantum qt6ct dolphin discord flameshot easyeffects \
    kdeconnect dropbox nitrogen nvidia-dkms nvidia-settings nvtop \
    firefox torbrowser-launcher librewolf opera steam alacritty \
    pipewire pipewire-pulse wireplumber nvidia-utils mesa \
    ttf-nerd-fonts-symbols ttf-nerd-fonts ttf-font-awesome wine

paru -Syyu linux-xanmod linux-xanmod-headers

# Instalación de i3lock-fancy-rapid desde AUR
echo -e "${GREEN} Instalando i3lock-fancy-rapid desde AUR...${RESET}"
paru -S --noconfirm i3lock-fancy-rapid-git

# Configuración de SDDM
echo -e "${GREEN} Configurando SDDM como gestor de sesión...${RESET}"
systemctl enable sddm

# Configuración de EasyEffects
echo -e "${GREEN} Configurando EasyEffects...${RESET}"
pacman -S --noconfirm easyeffects
mkdir -p ~/.config/easyeffects
cp /usr/share/easyeffects/presets/default.json ~/.config/easyeffects/

# Finalización
echo -e "${GREEN} Instalación completada. Reinicia el sistema y selecciona i3 en SDDM.${RESET}"
