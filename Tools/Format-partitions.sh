#################################
## ARCH - LINUX BY:NIIL78       #
#################################
echo -e '\e[92m ArchLinux Installer'
echo -e '\e[92m By:Niil78\e[0m'
sleep 2
echo -e '\e[92m  This tool will format the selected hard disks \e[0m'
echo -e '\e[92m  It will then mount the partitions and make them ready to start the installation.  \e[0m'
sleep 2
###############################
clear
echo -e '\e[92m  This tool will format the selected hard disks \e[0m'
echo -e '\e[92m  Select BOOT to format \e[0m'
lsblk
read boot
echo " Disc selected as BOOT  $boot..."
###########################
clear
echo -e '\e[92m  This tool will format the selected hard disks \e[0m'
echo -e '\e[92m  Select SWAP to format \e[0m'
echo -e '  [BOOT 👍]'
lsblk
read swap
echo -e '\e[92m  This tool will format the selected hard disks \e[0m'
echo " Disc selected as SWAP  $swap..."
############################
clear
echo -e '\e[92m  This tool will format the selected hard disks \e[0m'
echo -e '\e[92m  Select ROOT to format \e[0m'
echo -e '  [BOOT 👍] [SWAP 👍] '
lsblk
read root
echo " Disc selected as ROOT  $root..."
############################
clear
echo -e '\e[92m  This tool will format the selected hard disks \e[0m'
echo -e '\e[92m  Select HOME to format \e[0m'
echo -e '  [BOOT 👍] [SWAP 👍] [ROOT 👍] '
lsblk
read home
echo " Disc selected as HOME  $home..."
############################
clear
echo -e '  [BOOT 👍] [SWAP 👍] [ROOT 👍] [HOME 👍] '
echo -e '\e[92m  Ready to format the selected partitions. 
Confirm that the data is correct. If not, abort with (Control + c) \e[0m'

echo "/boot $boot"
echo "/swap $swap"
echo "/root $root"
echo "/home $home"

read -p "Press any key to continue. "

echo -e '\e[92 Formatting All selected partitions. \e[0m'
############## BOOT
sleep 1
mkfs.fat -F32 $boot
echo -e '  [BOOT 👍]'
############## SWAP
clear
echo -e '  [BOOT 👍]'
sleep 1
mkswap $swap
echo -e '  [BOOT 👍] [SWAP 👍]'
############## ROOT
clear
echo -e '  [BOOT 👍] [SWAP 👍]'
sleep 1
mkfs.ext4 $root
echo -e '  [BOOT 👍] [SWAP 👍] [ROOT 👍]'
############## HOME
clear
echo -e '  [BOOT 👍] [SWAP 👍] [ROOT 👍]'
sleep 1 
mkfs.ext4 $home
echo -e '  [BOOT 👍] [SWAP 👍] [ROOT 👍] [HOME 👍]'
clear 
echo -e '  [BOOT 👍] [SWAP 👍] [ROOT 👍] [HOME 👍]'
sleep 3

echo -e '\e[92m  Mounting the partitions  \e[0m'
############ ROOT
mount $root /mnt
echo -e '  [ROOT 👍]'
############ BOOT
mkdir -p /mnt/boot
mount $boot /mnt/boot
echo -e '  [BOOT 👍]'
############ HOME
mkdir -p /mnt/home
mount $home /mnt/home
echo -e '  [HOME 👍]'
############ SWAP
swapon $swap
echo -e '  [SWAP 👍]'
sleep 2

echo -e '\e[92m  Process Completed. \e[0m'