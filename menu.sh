show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}********************NIIL78*******************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} ArchLinux Basico ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} ArchLinux + App  ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Solo aplicaciones${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Selecciona una opcion del menu ${RED_TEXT}O largate. ${NORMAL}"
    read opt
}
function option_picked() {
    COLOR='\033[01;31m'
    RESET='\033[00;00m'
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then
            exit;
    else
        case $opt in
        1) clear;
        option_picked "ArchLinux Basico";
        chmod +x arch-Easy.sh;
        chmod +x arch_basic-install.sh;
        sh arch-Easy.sh;
        #show_menu;
        ;;
        2) clear;
        option_picked "ArchLinux Completo";
        chmod +x arch-Easy.sh;
        chmod +x arch_full-install.sh;
        sh arch-Easy.sh;
        #show_menu;
        ;;
        3) clear;
        option_picked "Solo Aplicaciones";
        chmod +x Aplicaciones/app_gestores.sh;
        sh Aplicaciones/app_gestores;
        show_menu;
            ;;
        x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
        option_picked "Escoge una opcion del menu";
        show_menu;
        ;;
    esac
fi
done
