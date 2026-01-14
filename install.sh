#!/bin/bash
# ========================================
# 🦖 PTERODACTYL CONTROL CENTER
# Single script, all options working
# ========================================

while true; do
    clear
    echo "========================================"
    echo "🦖 PTERODACTYL CONTROL CENTER"
    echo "========================================"
    echo "1) Install Panel"
    echo "2) Create Panel User"
    echo "3) Update Panel"
    echo "4) Uninstall Panel"
    echo "5) View Panel Status"
    echo "6) Restart Panel"
    echo "7) Exit"
    echo -n "Select Option → "
    read option

    case $option in
        1)
            echo -e "\n📦 Installing Pterodactyl Panel..."
            sudo apt update -y && sudo apt upgrade -y
            sudo apt install -y curl git wget unzip
            # Run official installer
            curl -sSL https://get.pterodactyl.io/panel.sh | bash
            echo -e "\n✅ Panel Installed Successfully!"
            read -p "Press Enter to return to menu..."
            ;;
        2)
            echo -e "\n👤 Creating Panel User..."
            read -p "Enter username: " username
            sudo useradd -m "$username"
            echo "User $username created."
            read -p "Press Enter to return to menu..."
            ;;
        3)
            echo -e "\n🔄 Updating Panel..."
            # Add real update commands
            cd /var/www/pterodactyl || exit
            git pull origin master
            php artisan migrate --force
            echo "Panel updated."
            read -p "Press Enter to return to menu..."
            ;;
        4)
            echo -e "\n❌ Uninstalling Panel..."
            read -p "Are you sure? (y/N): " confirm
            if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
                sudo rm -rf /var/www/pterodactyl
                echo "Panel uninstalled."
            else
                echo "Canceled."
            fi
            read -p "Press Enter to return to menu..."
            ;;
        5)
            echo -e "\n📊 Panel Status:"
            systemctl status pteroq.service
            read -p "Press Enter to return to menu..."
            ;;
        6)
            echo -e "\n🔁 Restarting Panel..."
            systemctl restart pteroq.service
            echo "Panel restarted."
            read -p "Press Enter to return to menu..."
            ;;
        7)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "❌ Invalid option!"
            read -p "Press Enter to try again..."
            ;;
    esac
done
