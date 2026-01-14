#!/bin/bash

# -------- COLORS ----------
GREEN="\e[32m"
CYAN="\e[36m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

pause() { read -p "Press Enter to continue..."; }

# ================= PTERODACTYL SUBMENU =================
panel_menu() {
while true; do
    clear
    echo -e "${YELLOW}╔══════════════════════════════════╗${RESET}"
    echo -e "${YELLOW}║  🦖 PTERODACTYL CONTROL CENTER  ║${RESET}"
    echo -e "${YELLOW}╚══════════════════════════════════╝${RESET}"
    echo
    echo -e "${GREEN}1) Install Panel${RESET}"
    echo -e "${CYAN}2) Create Panel User${RESET}"
    echo -e "${GREEN}3) Update Panel${RESET}"
    echo -e "${RED}4) Uninstall Panel${RESET}"
    echo -e "5) Back${RESET}"
    echo
    echo -ne "Select Option → "
    read p

    case $p in
        1)
            clear
            echo "Installing Pterodactyl Panel..."
            bash <(curl -s https://get.pterodactyl.io/panel.sh) # official installer
            pause
            ;;
        2)
            clear
            echo "Creating Panel User..."
            # Demo command; replace with real user creation if needed
            read -p "Enter username: " username
            read -s -p "Enter password: " password
            echo
            echo "User $username created (demo)"
            pause
            ;;
        3)
            clear
            echo "Updating Panel..."
            # Official update steps for Pterodactyl
            bash <(curl -s https://get.pterodactyl.io/panel.sh) --update
            pause
            ;;
        4)
            clear
            echo "Uninstalling Panel..."
            # Demo uninstall; replace with actual if needed
            echo "Pterodactyl Panel removed (demo)"
            pause
            ;;
        5)
            break
            ;;
        *)
            echo "Invalid option!"
            sleep 1
            ;;
    esac
done
}

# ================= MAIN MENU =================
while true; do
    clear
    echo -e "${YELLOW}╔══════════════════════════════════╗${RESET}"
    echo -e "${YELLOW}║       😴 SLEEPYBUDDY MANAGER     ║${RESET}"
    echo -e "${YELLOW}╚══════════════════════════════════╝${RESET}"
    echo
    echo -e "${GREEN}1) Pterodactyl Control Center${RESET}"
    echo -e "${CYAN}2) Wings Installer${RESET}"
    echo -e "${CYAN}3) Cloudflare Setup${RESET}"
    echo -e "${CYAN}4) System Info${RESET}"
    echo -e "${CYAN}5) Tailscale Install${RESET}"
    echo -e "${CYAN}6) Database Setup${RESET}"
    echo -e "${CYAN}7) Blueprint+Theme+Extensions${RESET}"
    echo -e "${CYAN}8) Uninstall Tools${RESET}"
    echo -e "${CYAN}9) Network Info${RESET}"
    echo -e "${CYAN}10) Exit${RESET}"
    echo
    echo -ne "Select Option → "
    read opt

    case $opt in
        1) panel_menu ;;
        2)
            clear
            echo "Wings Installer (demo)"
            pause
            ;;
        3)
            clear
            echo "Cloudflare Setup (demo)"
            pause
            ;;
        4)
            clear
            uname -a
            pause
            ;;
        5)
            clear
            echo "Tailscale Install (demo)"
            pause
            ;;
        6)
            clear
            echo "Database Setup (demo)"
            pause
            ;;
        7)
            clear
            echo "Blueprint+Theme+Extensions (demo)"
            pause
            ;;
        8)
            clear
            echo "Uninstall Tools (demo)"
            pause
            ;;
        9)
            clear
            echo "Network Info (demo)"
            pause
            ;;
        10)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option!"
            sleep 1
            ;;
    esac
done
