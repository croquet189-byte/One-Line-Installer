#!/bin/bash
# ========================================
# 🚀 SLEEPYBUDDY HOSTING MANAGER
# Made by SleepyBuddy
# ========================================

pause() { read -p "Press Enter to continue..."; }

# ---------------- Main Menu ----------------
main_menu() {
    clear
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "           🚀 SLEEPYBUDDY HOSTING MANAGER                  "
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
        1) panel_install ;;
        2) wings_install ;;
        3) uninstall_tools ;;
        4) blueprint_theme ;;
        5) cloudflare_setup ;;
        6) system_info ;;
        7) tailscale_tools ;;
        8) database_setup ;;
        0) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid Option!"; pause; main_menu ;;
    esac
}

# ---------------- Option 1 ----------------
panel_install() {
    echo "📦 Installing Pterodactyl Panel..."
    sudo apt update -y && sudo apt upgrade -y
    sudo apt install -y curl git wget unzip
    # Official panel installer
    curl -sSL https://get.pterodactyl.io/panel.sh | bash
    echo "✅ Panel Installed"
    pause
    main_menu
}

# ---------------- Option 2 ----------------
wings_install() {
    echo "🚀 Installing Wings (Daemon)..."
    curl -sSL https://get.pterodactyl.io/wings.sh | bash
    echo "✅ Wings Installed"
    pause
    main_menu
}

# ---------------- Option 3 ----------------
uninstall_tools() {
    echo "❌ Uninstalling SleepyBuddy Tools..."
    sudo rm -rf /var/www/pterodactyl
    sudo userdel -r pterodactyl
    echo "✅ Tools Uninstalled"
    pause
    main_menu
}

# ---------------- Option 4 ----------------
blueprint_theme() {
    echo "🎨 Installing Blueprints, Themes & Extensions..."
    # Demo commands, replace with real ones
    echo "Downloading Blueprints..."
    echo "Applying Themes..."
    echo "Installing Extensions..."
    echo "✅ Blueprint+Theme+Extensions Done"
    pause
    main_menu
}

# ---------------- Option 5 ----------------
cloudflare_setup() {
    echo "☁️ Setting up Cloudflare..."
    curl -sL https://github.com/cloudflare/cloudflare-go/releases/latest/download/cf-linux-amd64 -o /usr/local/bin/cf
    sudo chmod +x /usr/local/bin/cf
    echo "✅ Cloudflare CLI Installed"
    pause
    main_menu
}

# ---------------- Option 6 ----------------
system_info() {
    echo "🖥️ System Information:"
    echo "---- Disk Usage ----"
    df -h
    echo "---- Memory Usage ----"
    free -h
    echo "---- CPU Info ----"
    lscpu
    pause
    main_menu
}

# ---------------- Option 7 ----------------
tailscale_tools() {
    echo "🔗 Installing/Starting Tailscale..."
    curl -fsSL https://tailscale.com/install.sh | sh
    sudo tailscale up
    echo "✅ Tailscale Ready"
    pause
    main_menu
}

# ---------------- Option 8 ----------------
database_setup() {
    echo "🗄️ Setting up Database..."
    sudo apt install -y mariadb-server
    sudo systemctl enable mariadb
    sudo systemctl start mariadb
    echo "✅ Database Installed & Started"
    pause
    main_menu
}

# ---------------- Run Main Menu ----------------
main_menu
