#!/bin/bash

# ===== Colors =====
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
RESET="\e[0m"

# ===== Root check =====
if [ "$EUID" -ne 0 ]; then
  echo "Run as root"
  exit 1
fi

install_deps() {
  echo "🚀 Custom Installer Started"
  echo "Updating system..."
  apt update -y

  echo "Installing required packages..."
  apt install -y curl wget git sudo
}

banner() {
clear
echo -e "${RED}"
cat << "EOF"
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 😴 SLEEPYBUDDY HOSTING MANAGER
 made by SleepyBuddy
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
echo -e "${RESET}"
}

menu() {
echo -e "${CYAN}"
echo "1) Panel Installation"
echo "2) Wings Installation"
echo "3) Uninstall Tools"
echo "4) Blueprint + Theme + Extensions"
echo "5) Cloudflare Setup"
echo "6) System Information"
echo "7) Tailscale (install + up)"
echo "8) Database Setup"
echo "0) Exit"
echo -e "${RESET}"
read -p "Select an option [0-8]: " opt
}

while true; do
  banner
  menu
  case $opt in
    1) echo "Panel installer coming soon"; sleep 2 ;;
    2) echo "Wings installer coming soon"; sleep 2 ;;
    3) echo "Uninstall tools coming soon"; sleep 2 ;;
    4) echo "Blueprint setup coming soon"; sleep 2 ;;
    5) echo "Cloudflare setup coming soon"; sleep 2 ;;
    6) uname -a; read -p "Enter to return" ;;
    7) curl -fsSL https://tailscale.com/install.sh | sh && tailscale up ;;
    8) echo "Database setup coming soon"; sleep 2 ;;
    0) echo "Goodbye 😴"; exit 0 ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
done
