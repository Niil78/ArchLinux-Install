echo -e 'Llego la hora de particionar'
echo -e '/dev/sda[120GB]'
echo -e '/dev/sda -> /boot[512M]'
echo -e '/dev/sda -> /swap[4G]'
echo -e '/dev/sda -> /root[50G]'
echo -e '/dev/sda -> /Home[resto]'
sleep 15
echo -e 'n (Crea una nueva partición)'
echo -e 'Dejar número de la partición por defecto, presionando ENTER'
echo -e 'Dejar por defecto el sector inicial, presionando ENTER'
echo -e 'Para el sector final, escribir +TAMAÑO y presionar ENTER'
echo -e 'Escribir TIPO cuando se pida código de partición y luego ENTER'
echo -e 'w (Para escribir los cambios y luego ENTER)'
echo -e 'y (Para aceptar los cambios y luego ENTER)'
sleep 10
echo -e 'Crear particion GPT'
gdisk /dev/sda
echo -e '1º particion /boot[512M] TIPO: EF00 /> N ENTER ENTER +512M ENTER W Y'
gdisk /dev/sda
clear
echo -e '2º particion /swap[4G] TIPO: 8200 /> N ENTER ENTER +4G ENTER W Y '
gdisk /dev/sda
clear
echo -e '3º particion /root[50G] TIPO: 8304  /> N ENTER ENTER +50G ENTER W Y'
gdisk /dev/sda
clear
echo -e '4º particion /home TIPO: 8302 /> N ENTER ENTER ENTER ENTER W Y'
gdisk /dev/sda
clear
echo -e 'Listo Particionado finalizado'
lsblk
echo -e 'Ejecutando formato'
chmod +x arch-formato.sh
sh arch-formato.sh
