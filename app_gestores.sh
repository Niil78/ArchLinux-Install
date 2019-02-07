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
#
# PAKKU GESTOR AYUDANTE DE PACMAN
#
git clone https://aur.archlinux.org/pakku.git
cd pakku
sudo makepkg -si
pakku -Syu
cd ..
echo -e 'Finalizado'
