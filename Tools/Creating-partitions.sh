
#################################
## ARCH - LINUX BY:NIIL78       #
#################################
echo -e '\e[92m ArchLinux Installer'
echo -e '\e[92m By:Niil78\e[0m'
sleep 2
echo -e 'This is a \e[0;31m GUIDE \e[0m process for creating partitions. 
This process will \e[0;31m GUIDE \e[0m you to create 4 partitions. \e[1;34m BOOT / SWAP / ROOT AND HOME \e[0m '

echo -e "The recommendation is:"
echo -e "Create a \e[0;31m 512MB BOOT \e[0m partition."
echo -e "Create a \e[0;31m SWAP \e[0m partition \e[0;31m twice or the same size as your ram memory \e[0m"
echo -e "Create a \e[0;31m ROOT \e[0m partition of \e[0;31m at least 20Gb. \e[0m"
echo -e "Create a \e[0;31m HOME \e[0m partition with as much space as you want \e[0;31m (at least 4Gb is recommended) \e[0m."
sleep 10

echo "Select a disc to start"
echo -e "\e[0;31m Type the full address. e.g. /dev/sda \e[0m"
lsblk
read disk 
clear
#######################

echo -e "Next we will prepare the selected disc. "
echo -e "\e[0;31m Follow the instructions \e[0m"
echo -e 'Crear particion GPT'
echo -e 'Press these keys \e[1;34m O \e[0m-\e[1;34m [ENTER] \e[0m-\e[1;34m Y \e[0m-\e[1;34m [ENTER] \e[0m-\e[1;34m W \e[0m-\e[1;34m [ENTER] \e[0m-\e[1;34m Y \e[0m-\e[1;34m [ENTER] \e[0m to create a GPT partition'
gdisk $disk
echo -e 'Full format'
sleep 2
clear
#######################
echo -e 'We will create 4 partitions '
echo -e '/dev/sdX1 -> /boot TYPE: EF00'
echo -e '/dev/sdX2 -> /swap TYPE: 8200'
echo -e '/dev/sdX3 -> /root TYPE: 8304'
echo -e '/dev/sdX4 -> /Home TYPE: 8302'

echo -e "######          #######"
echo -e "# P A R T I T I O N S #"
echo -e "######          #######"
echo -e '/dev/sdX1 -> /boot TYPE: EF00'
echo -e '/dev/sdX2 -> /swap TYPE: 8200'
echo -e '/dev/sdX3 -> /root TYPE: 8304'
echo -e '/dev/sdX4 -> /Home TYPE: 8302'

############ BOOT
echo -e '\e[91m 1º Partition /boot[512M] \e[0m'
echo -e '\e[91m Follow these steps \e[0m'
echo -e 'N-\e[1;34m [ENTER] \e[0m-\e[1;34m [ENTER] \e[0m- +512M \e[1;34m [ENTER] \e[0m EF00 \e[1;34m [ENTER] \e[0m W \e[1;34m [ENTER] \e[0m Y \e[1;34m [ENTER] \e[0m'
gdisk $disk
clear
############ SWAP

echo -e "######          #######"
echo -e "# P A R T I T I O N S #"
echo -e "######          #######"
echo -e '/dev/sdX1 -> /boot TYPE: EF00'
echo -e '/dev/sdX2 -> /swap TYPE: 8200'
echo -e '/dev/sdX3 -> /root TYPE: 8304'
echo -e '/dev/sdX4 -> /Home TYPE: 8302'

echo -e '\e[91m 2º Partition /swap \e[0m'
echo -e '\e[91m Follow these steps \e[0m'
echo -e 'N-\e[1;34m [ENTER] \e[0m-\e[1;34m [ENTER] \e[0m- +\e[1;32m Desired capacity  \e[0m \e[1;34m [ENTER] \e[0m 8200 \e[1;34m [ENTER] \e[0m W \e[1;34m [ENTER] \e[0m Y \e[1;34m [ENTER] \e[0m'
gdisk $disk
clear
############ ROOT

echo -e "######          #######"
echo -e "# P A R T I T I O N S #"
echo -e "######          #######"
echo -e '/dev/sdX1 -> /boot TYPE: EF00'
echo -e '/dev/sdX2 -> /swap TYPE: 8200'
echo -e '/dev/sdX3 -> /root TYPE: 8304'
echo -e '/dev/sdX4 -> /Home TYPE: 8302'

echo -e '\e[91m 3º Partition /root \e[0m'
echo -e '\e[91m Follow these steps \e[0m'
echo -e 'N-\e[1;34m [ENTER] \e[0m-\e[1;34m [ENTER] \e[0m- +\e[1;32m Desired capacity  \e[0m \e[1;34m [ENTER] \e[0m 8304 \e[1;34m [ENTER] \e[0m W \e[1;34m [ENTER] \e[0m Y \e[1;34m [ENTER] \e[0m'
gdisk $disk
clear
############ HOME

echo -e "######          #######"
echo -e "# P A R T I T I O N S #"
echo -e "######          #######"
echo -e '/dev/sdX1 -> /boot TYPE: EF00'
echo -e '/dev/sdX2 -> /swap TYPE: 8200'
echo -e '/dev/sdX3 -> /root TYPE: 8304'
echo -e '/dev/sdX4 -> /Home TYPE: 8302'

echo -e '\e[91m 4º Partition /home \e[0m'
echo -e '\e[91m Follow these steps \e[0m'
echo -e 'N-\e[1;34m [ENTER] \e[0m-\e[1;34m [ENTER] \e[0m- +\e[1;32m Desired capacity  \e[0m \e[1;34m [ENTER] \e[0m 8302 \e[1;34m [ENTER] \e[0m W \e[1;34m [ENTER] \e[0m Y \e[1;34m [ENTER] \e[0m'
gdisk $disk
clear

echo -e ' [BOOT 👍] [SWAP 👍] [ROOT 👍] [HOME 👍]'
echo -e echo -e '\e[92m Process Completed. \e[0m'
sleep 2
clear
###################################