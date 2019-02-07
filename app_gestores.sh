echo -e 'Instalacion dependencias previas'
pacman -Qg base-devel 
sleep 1
pacman -S --noconfirm git base-devel
#
# YAY GESTOR AYUDANTE DE PACMAN
#
git clone https://aur.archlinux.org/yay.git
cd yay
sudo makepkg -si
yay -Syu
cd ..
echo -e 'Yay instalado correctamente'
sleep 4
clear
#
# PAKKU GESTOR AYUDANTE DE PACMAN
#
git clone https://aur.archlinux.org/pakku.git
cd pakku
sudo makepkg -si
pakku -Syu
cd ..
echo -e 'Pakku instalado correctamente'
sleep 4
clear
echo -e 'Finalizado'
