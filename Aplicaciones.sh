#KDE PLASMA
pacman -Syu --noconfirm plasma plasma-meta sddm
systemctl enable sddm
#systemctl restart sddm
#Descomentar si se usa tras la instalacion y no durante.
##
##
##
# Aqui van algunas aplicaciones que suelo utilizar.
# Gestores de paquetes comprimidos
echo -e 'Gestores de paquetes y carptas'
sudo pacman -Syyu --noconfirm p7zip unrar tar rsync ark steghide thunar
sleep 4
clear
# Arduino y otras herramientas
echo -e 'Arduino y otras herramientas'
sudo pacman -S --noconfirm notepadqq atom arduino arduino-builder arduino-docs arduino-cli arduino-ctags arduino-avr-core
sleep 4
echo -e 'Bluetooth y otras'
sudo pacman -S --noconfirm bluez bluedevil bluez-utils pulseaudio-bluetooth
clear
# Herramientas basicas
echo -e 'Herramientas basicas'
sudo pacman -S --noconfirm terminator screen filezilla archey3 atom ksystemlog libreoffice firefox opera rclone iptraf-ng kdeconnect
sudo pacman -S --noconfirm weechat teamspeak openvpn inkscape ardour pacmatic arpwatch ntop htop tcpdump
sudo pacman -S --noconfirm john nmap tor veracrypt lynis ettercap-gtk hydra nikto sqlmap ifuse aircrack-ng wireshark-gtk teamviewer
sudo pacman -S --noconfirm kdesdk-thumbnailers kdf sweeper cbatticon

sleep 4
clear
# 3D printer
sudo pacman -S --noconfirm cura curaengine cura-binary-data
sleep 4
clear
echo -e 'finalizado'
##
## GESTORES
##
echo -e 'GESTORES'
sleep 1
echo -e 'Instalacion dependencias previas'
pacman -Qg base-devel
sleep 1
pacman -S --noconfirm git base-devel
echo -e 'Vamos a instalar unos gestores de paquetes'
echo -e 'Funcionan exactamente igual que pacman'
echo -e 'Puedes instalar paquetes desde AUR mas facil'
sleep 5

#
# YAY GESTOR AYUDANTE DE PACMAN
# https://wiki.archlinux.org/index.php/AUR_helpers_(Espa%C3%B1ol)
echo -e 'Comenzamos la descarga de YAY y su instalacion'
sleep 1
git clone https://aur.archlinux.org/yay.git
cd yay
sudo makepkg -si
yay -Syu
cd ..
echo -e 'Yay instalado correctamente'
sleep 4
clear
#(Utilizo Tambien Pakku por que suele dar menos problemas con las llaves gpg)
# PAKKU GESTOR AYUDANTE DE PACMAN
# https://github.com/kitsunyan/pakku
git clone https://aur.archlinux.org/pakku.git
cd pakku
sudo makepkg -si
pakku -Syu
cd ..
echo -e 'Pakku instalado correctamente'
sleep 4
clear
rm -rf yay pakku
echo -e 'Finalizado'
