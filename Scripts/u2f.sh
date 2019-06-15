#Instalacion y configuracion basica
pacman -Sy pam-u2f                   #instalamos pamu2fcfg
touch ~/.keys/u2f_keys               #creamos el archivo de keys
read -p "PRESIONA CUALQUIER TECLA"
echo -e 'Se le pedira que pulse el boton la llave.'
echo -e 'Durante un tiempo limitado preste atencion.'
pamu2fcfg -u niil > ~/.keys/u2f_keys #Usuario niil
cat ~/.keys/u2f_keys                 #Comprobamos que se gurado la key
pamu2fcfg > ~/.keys/u2f_keys         #Definimos donde estan las keys
