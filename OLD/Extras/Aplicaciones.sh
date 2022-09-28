#KDE PLASMA
#echo -e 'KDE&SDDM'
#pacman -Syu --noconfirm plasma plasma-meta sddm
#systemctl enable sddm
#systemctl restart sddm
#Descomentar si se usa tras la instalacion y no durante.
##
##BASICAS
pacman -S iw wpa_supplicant dialog vim sudo
##
# Aqui van algunas aplicaciones que suelo utilizar.
# Gestores de paquetes comprimidos
sudo pacman -Syyu --noconfirm p7zip unrar tar rsync ark  thunar
clear
# Arduino y otras herramientas
sudo pacman -S --noconfirm notepadqq mtpfs atom arduino arduino-builder arduino-docs arduino-cli arduino-ctags arduino-avr-core atom openvpn
sudo pacman -S --noconfirm bluez bluedevil bluez-utils pulseaudio-bluetooth
clear
#Seguridad informatica & otr@s
sudo pacman -S --noconfirm rclone aircrack-ng wireshark-gtk veracrypt john nmap tor
sudo pacman -S --noconfirm arpwatch ettercap-gtk hydra nikto lynis sqlmap iptraf-ng
#Navegadores
sudo pacman -S --noconfirm firefox opera chromium
#Chats
sudo pacman -S --noconfirm weechat teamspeak3

# Herramientas basicas
sudo pacman -S --noconfirm terminator screen filezilla  ksystemlog libreoffice inkscape ntop htop tcpdump steghide
sudo pacman -S --noconfirm kdeconnect ifuse teamviewer
sudo pacman -S --noconfirm kdesdk-thumbnailers kdf sweeper cbatticon
sudo pacman -S --noconfirm ardour pacmatic
clear
# 3D printer
sudo pacman -S --noconfirm cura curaengine cura-binary-data
sleep 4
clear
echo -e 'finalizado'
