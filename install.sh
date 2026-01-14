#!/bin/bash

# -------- COLORS --------
GREEN="\e[32m"
RED="\e[31m"
CYAN="\e[36m"
YELLOW="\e[33m"
RESET="\e[0m"

# -------- ROOT CHECK --------
if [ "$EUID" -ne 0 ]; then
  echo "Run as root"
  exit 1
fi

pause() { read -p "Press Enter to continue..."; }

# ================= MAIN BANNER =================
main_banner() {
clear
echo -e "${YELLOW}"
cat << "EOF"
╔══════════════════════════════════════╗
║ 😴  SLEEPYBUDDY HOSTING MANAGER      ║
╚══════════════════════════════════════╝
EOF
echo -e "${RESET}"
}

# ================= PANEL BANNER =================
panel_banner() {
clear
echo -e "${CYAN}"
cat << "EOF"
╔══════════════════════════════════════╗
║ 🦖  PTERODACTYL CONTROL CENTER       ║
╚══════════════════════════════════════╝
EOF
echo -e "${RESET}"
}

# ================= PANEL MENU =================
panel_menu() {
while true; do
  panel_banner
  echo -e "${GREEN}1) Install Panel"
  echo -e "${CYAN}2) Create Panel User"
  echo -e "${GREEN}3) Update Panel"
  echo -e "${RED}4) Uninstall Panel"
  echo -e "5) Back${RESET}"
  echo
  read -p "Select Option → " p

  case $p in
    1)
      panel_banner
      echo "Installing Panel..."
      bash <(curl -fsSL https://pterodactyl-installer.se)
      pause
      ;;
    2)
      panel_banner
      cd /var/www/pterodactyl || { echo "Panel not installed"; pause; continue; }
      php artisan p:user:make
      pause
      ;;
    3)
      panel_banner
      cd /var/www/pterodactyl || { echo "Panel not installed"; pause; continue; }
      php artisan down
      curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xz
      chmod -R 755 storage/* bootstrap/cache
      composer install --no-dev --optimize-autoloader
      php artisan migrate --seed --force
      php artisan up
      pause
      ;;
    4)
      panel_banner
      read -p "Type YES to confirm uninstall: " c
      if [ "$c" = "YES" ]; then
        rm -rf /var/www/pterodactyl
        echo "Panel removed"
      fi
      pause
      ;;
    5) break ;;
    *) echo "Invalid"; sleep 1 ;;
  esac
done
}

# ================= MAIN MENU =================
while true; do
main_banner
echo -e "${GREEN}1) Pterodactyl Control Center"
echo -e "${CYAN}2) Wings Installer"
echo -e "${CYAN}3) System Information"
echo -e "${RED}0) Exit${RESET}"
echo
read -p "Select Option → " opt

case $opt in
  1) panel_menu ;;
  2)
     echo "Wings installer coming next"
     pause
     ;;
  3)
     uname -a
     pause
     ;;
  0) exit 0 ;;
  *) echo "Invalid option"; sleep 1 ;;
esac
done
