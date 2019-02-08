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
sudo pacman -S --noconfirm terminator screen filezilla archey3 atom ksystemlog libreoffice firefox opera rclone iptraf-ng kdeconnect
sudo pacman -S --noconfirm weechat teamspeak openvpn inkscape ardour pacmatic arpwatch ntop htop tcpdump
sudo pacman -S --noconfirm  john nmap tor veracrypt lynis ettercap-gtk hydra nikto sqlmap ifuse aircrack-ng wireshark-gtk teamviewer
sleep 4
clear
# 3D printer
sudo pacman -S --noconfirm cura curaengine cura-binary-data
sleep 4
clear
echo -e 'finalizado'
