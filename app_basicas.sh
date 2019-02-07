# Aqui van algunas aplicaciones que suelo utilizar. 
# Gestores de paquetes comprimidos 
echo -e 'Gestores de paquetes y carptas'
sudo pacman -Syyu --noconfirm p7zip unrar tar rsync ark steghide thunar
sleep 4
clear
# Arduino y otras herramientas
echo -e 'Arduino y otras herramientas'
sudo pacman -S --noconfirm notepadqq arduino arduino-builder arduino-docs arduino-cli arduino-ctags arduino-avr-core
sleep 4
clear
# Herramientas basicas
echo -e 'Herramientas basicas'
sudo pacman -S --noconfirm terminator screen filezilla archey3 ksystemlog libreoffice firefox opera rclone iptraf-ng kdeconnect
sleep 4
clear
# 3D printer
sudo pacman -S --noconfirm cura curaengine cura-binary-data
sleep 4
clear
echo -e 'finalizado'
