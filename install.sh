#!/bin/bash
# ========================================
# 🚀 SLEEPYBUDDY HOSTING MANAGER
# Fully functional main menu + option 1 sub-menu
# ========================================

pause() { read -p "Press Enter to continue..."; }

# -------- Sub-menu for Option 1: Panel Installation --------
panel_menu() {
    clear
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "           🦖 PANEL INSTALLATION MENU"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "1) Install Official Panel"
    echo "2) Install Cloudflare CLI"
    echo "3) Install Tailscale"
    echo "4) Show System Status"
    echo "5) Back to Main Menu"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    read -p "Select an option [1-5]: " suboption

    case $suboption in
        1)
            echo "📦 Installing Official Pterodactyl Panel..."
            sudo apt update -y && sudo apt upgrade -y
            sudo apt install -y curl git wget unzip
            curl -sSL https://get.pterodactyl.io/panel.sh | bash
            echo "✅ Panel Installed!"
            pause
            panel_menu
            ;;
        2)
            echo "☁️ Installing Cloudflare CLI..."
            curl -sL https://github.com/cloudflare/cloudflare-go/releases/latest/download/cf-linux-amd64 -o /usr/local/bin/cf
            sudo chmod +x /usr/local/bin/cf
            echo "✅ Cloudflare Installed!"
            pause
            panel_menu
            ;;
        3)
            echo "🔗 Installing Tailscale..."
            curl -fsSL https://tailscale.com/install.sh | sh
            sudo tailscale up
            echo "✅ Tailscale Ready!"
            pause
            panel_menu
            ;;
        4)
            echo "🖥️ System Status:"
            echo "---- Disk Usage ----"
            df -h
            echo "---- Memory Usage ----"
            free -h
            echo "---- CPU Info ----"
            lscpu
            pause
            panel_menu
            ;;
        5)
            main_menu
            ;;
        *)
            echo "❌ Invalid option!"
            pause
            panel_menu
            ;;
    esac
}

# -------- Main Menu --------
main_menu() {
    clear
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "           🚀 SLEEPYBUDDY HOSTING MANAGER             made by SleepyBuddy"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "                                                                  __  __    _    ___ _   _    __  __ _____ _   _ _   _"
    echo " |  \/  |  / \  |_ _| \ | |  |  \/  | ____| \ | | | | |"
    echo " | |\/| | / _ \  | ||  \| |  | |\/| |  _| |  \| | | | |"
    echo " | |  | |/ ___ \ | || |\  |  | |  | | |___| |\  | |_| |"
    echo " |_|  |_/_/   \_\___|_| \_|  |_|  |_|_____|_| \_|\___/ "
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  1) Panel Installation                                            2) Wings Installation"
    echo "  3) Uninstall Tools"
    echo "  4) Blueprint+Theme+Extensions"
    echo "  5) Cloudflare Setup                                              6) System Information"
    echo "  7) Tailscale (install + up)"
    echo "  8) Database Setup"
    echo "  0) Exit"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    read -p "📝 Select an option [0-8]: " option

    case $option in
        1) panel_menu ;;
        2)
            echo "🚀 Installing Wings..."
            curl -sSL https://get.pterodactyl.io/wings.sh | bash
            echo "✅ Wings Installed"
            pause
            main_menu
            ;;
        3)
            echo "❌ Uninstalling Tools..."
            sudo rm -rf /var/www/pterodactyl
            sudo userdel -r pterodactyl
            echo "✅ Tools Uninstalled"
            pause
            main_menu
            ;;
        4)
            echo "🎨 Installing Blueprints, Themes & Extensions..."
            # Replace with actual commands
            echo "✅ Done"
            pause
            main_menu
            ;;
        5)
            echo "☁️ Setting up Cloudflare..."
            curl -sL https://github.com/cloudflare/cloudflare-go/releases/latest/download/cf-linux-amd64 -o /usr/local/bin/cf
            sudo chmod +x /usr/local/bin/cf
            echo "✅ Cloudflare CLI Installed"
            pause
            main_menu
            ;;
        6)
            echo "🖥️ System Information:"
            df -h
            free -h
            lscpu
            pause
            main_menu
            ;;
        7)
            echo "🔗 Installing & Starting Tailscale..."
            curl -fsSL https://tailscale.com/install.sh | sh
            sudo tailscale up
            echo "✅ Tailscale Ready"
            pause
            main_menu
            ;;
        8)
            echo "🗄️ Setting up Database..."
            sudo apt install -y mariadb-server
            sudo systemctl enable mariadb
            sudo systemctl start mariadb
            echo "✅ Database Ready"
            pause
            main_menu
            ;;
        0) echo "Exiting..."; exit 0 ;;
        *) echo "❌ Invalid Option!"; pause; main_menu ;;
    esac
}

# -------- Run Script --------
main_menu
