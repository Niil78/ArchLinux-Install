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
