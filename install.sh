#!/bin/bash

# -------- COLORS ----------
GREEN="\e[32m"
RED="\e[31m"
CYAN="\e[36m"
YELLOW="\e[33m"
RESET="\e[0m"

# -------- ROOT CHECK ----------
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

pause() {
  read -p "Press Enter to continue..."
}

banner() {
  clear
  echo -e "${YELLOW}"
  cat << "EOF"
╔══════════════════════════════════════╗
║ 🦖  PTERODACTYL CONTROL CENTER       ║
╚══════════════════════════════════════╝
EOF
  echo -e "${RESET}"
}

# -------- OPTION FUNCTIONS ----------

install_panel() {
  banner
  echo -e "${GREEN}Installing Pterodactyl Panel...${RESET}"
  bash <(curl -fsSL https://pterodactyl-installer.se)
  pause
}

create_panel_user() {
  banner
  if [ ! -d /var/www/pterodactyl ]; then
    echo -e "${RED}Panel not installed!${RESET}"
    pause
    return
  fi
  cd /var/www/pterodactyl || return
  php artisan p:user:make
  pause
}

update_panel() {
  banner
  if [ ! -d /var/www/pterodactyl ]; then
    echo -e "${RED}Panel not installed!${RESET}"
    pause
    return
  fi

  echo -e "${GREEN}Updating Panel...${RESET}"
  cd /var/www/pterodactyl || return
  php artisan down
  curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xz
  chmod -R 755 storage/* bootstrap/cache
  composer install --no-dev --optimize-autoloader
  php artisan migrate --seed --force
  php artisan up
  pause
}

uninstall_panel() {
  banner
  read -p "Type YES to uninstall panel: " confirm
  if [ "$confirm" = "YES" ]; then
    rm -rf /var/www/pterodactyl
    echo -e "${RED}Panel removed${RESET}"
  else
    echo "Cancelled"
  fi
  pause
}

# -------- MAIN MENU LOOP ----------
while true; do
  banner
  echo -e "${GREEN}1) Install Panel"
  echo -e "${CYAN}2) Create Panel User"
  echo -e "${GREEN}3) Update Panel"
  echo -e "${RED}4) Uninstall Panel"
  echo -e "5) Exit${RESET}"
  echo
  read -p "Select Option → " opt

  case $opt in
    1) install_panel ;;
    2) create_panel_user ;;
    3) update_panel ;;
    4) uninstall_panel ;;
    5) exit 0 ;;
    *) echo -e "${RED}Invalid option${RESET}"; sleep 1 ;;
  esac
done
