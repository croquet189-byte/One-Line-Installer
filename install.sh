#!/bin/bash

# ===== Colors =====
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"
BOLD="\e[1m"

clear

banner() {
echo -e "${RED}"
cat << "EOF"
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 😴 SLEEPYBUDDY HOSTING MANAGER
 made by SleepyBuddy
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 ███████╗██╗     ███████╗███████╗██████╗ ██╗   ██╗██████╗ ██████╗ ██╗   ██╗
 ██╔════╝██║     ██╔════╝██╔════╝██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗╚██╗ ██╔╝
 ███████╗██║     █████╗  █████╗  ██████╔╝ ╚████╔╝ ██████╔╝██║  ██║ ╚████╔╝
 ╚════██║██║     ██╔══╝  ██╔══╝  ██╔═══╝   ╚██╔╝  ██╔══██╗██║  ██║  ╚██╔╝
 ███████║███████╗███████╗███████╗██║        ██║   ██████╔╝██████╔╝   ██║
 ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝        ╚═╝   ╚═════╝ ╚═════╝    ╚═╝

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
echo -e "${RESET}"
}

menu() {
echo -e "${CYAN}1) Panel Installation"
echo -e "2) Wings Installation"
echo -e "3) Uninstall Tools"
echo -e "4) Blueprint + Theme + Extensions"
echo -e "5) Cloudflare Setup"
echo -e "6) System Information"
echo -e "7) Tailscale (install + up)"
echo -e "8) Database Setup"
echo -e "0) Exit${RESET}"
echo ""
read -p "📌 Select an option [0-8]: " choice
}

panel_install() {
echo -e "${GREEN}Installing Panel...${RESET}"
sleep 2
}

wings_install() {
echo -e "${GREEN}Installing Wings...${RESET}"
sleep 2
}

uninstall_tools() {
echo -e "${YELLOW}Uninstalling tools...${RESET}"
sleep 2
}

blueprint_theme() {
echo -e "${GREEN}Installing Blueprint / Theme / Extensions...${RESET}"
sleep 2
}

cloudflare_setup() {
echo -e "${GREEN}Setting up Cloudflare...${RESET}"
sleep 2
}

system_info() {
echo -e "${CYAN}"
neofetch || uname -a
echo -e "${RESET}"
read -p "Press Enter to return..."
}

tailscale_install() {
echo -e "${GREEN}Installing Tailscale...${RESET}"
curl -fsSL https://tailscale.com/install.sh | sh
tailscale up
}

database_setup() {
echo -e "${GREEN}Setting up Database...${RESET}"
sleep 2
}

while true; do
clear
banner
menu
case $choice in
1) panel_install ;;
2) wings_install ;;
3) uninstall_tools ;;
4) blueprint_theme ;;
5) cloudflare_setup ;;
6) system_info ;;
7) tailscale_install ;;
8) database_setup ;;
0) echo -e "${RED}Goodbye from SleepyBuddy 👋${RESET}"; exit 0 ;;
*) echo -e "${RED}Invalid option!${RESET}"; sleep 1 ;;
esac
done
