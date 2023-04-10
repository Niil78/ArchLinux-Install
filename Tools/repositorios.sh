
# Comprobar si se ejecuta como root
if [ "$EUID" -ne 0 ]
  then echo "Por favor, ejecute como root"
  exit
fi

# Añadir el repositorio de i3wm-gaps a la lista de repositorios
#echo -e "\n[i3wm-gaps]\nSigLevel = Optional TrustAll\nServer = https://dl.bintray.com/procrastinatus/i3wm-gaps" >> /etc/pacman.conf
#echo "I3WM-GAPS añadido con éxito"

cd /tmp
pacman -S --needed curl

#Añadir repositorios de ArchAssault

#echo "Añadir el repositorio de ArchAssault a la lista de repositorios..."
#echo "[archstrike]" >> /etc/pacman.conf
#echo "#SigLevel = Never" >> /etc/pacman.conf
#echo "#Server = https://repo.archassault.org/\$arch" >> /etc/pacman.conf
#echo "ArchAssault añadido con éxito"

#Añadir repositorios de Chaotic-AUR

echo "Añadir el repositorio de Chaotic-AUR a la lista de repositorios..."

pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo "[chaotic-aur]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
echo "Repositorio añadido con éxito"

# Añade el repositorio de BlackArch
echo "Añadiendo el repositorio de BlackArch"

curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

# Actualiza la base de datos de paquetes
echo "Actualizando la base de datos de paquetes"
sudo pacman -Syy

# Instala las claves de confianza
echo "Instalando las claves de confianza"
sudo pacman-key --init
sudo pacman-key --populate blackarch
echo "Repositorio añadido con éxito"


#herramientas necesarias.

pacman -S --needed paru

