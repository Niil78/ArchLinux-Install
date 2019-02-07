# Aqui van algunas aplicaciones que suelo utilizar. 
# Gestores de paquetes comprimidos 
echo -e 'Gestores de paquetes y carptas'
pacman -Syyu --noconfirm p7zip p7zip-plugins unrar tar rsync ark steghide thunnar
# Arduino y otras herramientas
echo -e 'Arduino y otras herramientas'
pacman -S --noconfirm notepad arduino arduino-builder arduino-docs arduino-cli arduino-ctags arduino-avr-core
# Herramientas basicas
echo -e 'Herramientas basicas'
pacman -S --noconfirm terminator screen filezilla alsi archey3 KSystemLog libreoffice firefox opera dropbox iptraf
# 3D printer
pacman -S --noconfirm cura curaengine cura-binary-data

#
# YAY GESTOR AYUDANTE DE PACMAN
#
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Syu
#
# PAKKU GESTOR AYUDANTE DE PACMAN
#
git clone https://aur.archlinux.org/pakku.git
cd pakku
makepkg -si
pakku -Syu
