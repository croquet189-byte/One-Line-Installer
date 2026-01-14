#!/bin/bash
#==================================================
#           PTERODACTYL CONTROL CENTER
#==================================================

# Colors for menu
GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

#----------------------
# Functions for each option
#----------------------

install_panel() {
    echo -e "${GREEN}🚀 Installing Pterodactyl Panel...${RESET}"
    # Run the official Pterodactyl install script
    bash <(curl -s https://raw.githubusercontent.com/pterodactyl/panel/develop/install.sh)
    echo -e "${GREEN}✅ Panel installation completed!${RESET}"
    read -p "Press Enter to return to menu..."
}

create_user() {
    echo -e "${BLUE}👤 Create Panel User${RESET}"
    read -p "Enter new panel username: " username
    read -sp "Enter password: " password
    echo
    # Here you would run the real user creation command or DB insert
    echo -e "${BLUE}User ${username} created (demo)${RESET}"
    read -p "Press Enter to return to menu..."
}

update_panel() {
    echo -e "${YELLOW}🔄 Updating Panel...${RESET}"
    cd /var/www/pterodactyl || { echo "Directory not found!"; return; }
    git pull origin master
    composer install --no-dev --optimize-autoloader
    php artisan migrate --force
    php artisan view:clear
    php artisan cache:clear
    php artisan config:clear
    echo -e "${YELLOW}✅ Panel updated!${RESET}"
    read -p "Press Enter to return to menu..."
}

uninstall_panel() {
    echo -e "${RED}⚠️ Uninstalling panel...${RESET}"
    systemctl stop pteroq.service
    rm -rf /var/www/pterodactyl
    echo -e "${RED}✅ Panel uninstalled!${RESET}"
    read -p "Press Enter to return to menu..."
}

exit_menu() {
    echo "👋 Exiting..."
    exit 0
}

#----------------------
# Main Menu
#----------------------
while true; do
    clear
    echo "==========================================="
    echo -e "${YELLOW}🦖  PTERODACTYL CONTROL CENTER${RESET}"
    echo "==========================================="
    echo -e "${GREEN}1) Install Panel${RESET}"
    echo -e "${BLUE}2) Create Panel User${RESET}"
    echo -e "${YELLOW}3) Update Panel${RESET}"
    echo -e "${RED}4) Uninstall Panel${RESET}"
    echo -e "5) Exit"
    echo
    read -p "Select Option → " choice
    case $choice in
        1) install_panel ;;
        2) create_user ;;
        3) update_panel ;;
        4) uninstall_panel ;;
        5) exit_menu ;;
        *) echo "Invalid option! Press Enter to try again..." ; read ;;
    esac
done
