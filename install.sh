#!/bin/bash

while true; do
  clear

  echo -e "\e[33m╔══════════════════════════════════╗\e[0m"
  echo -e "\e[33m║  🦖 PTERODACTYL CONTROL CENTER  ║\e[0m"
  echo -e "\e[33m╚══════════════════════════════════╝\e[0m"
  echo
  echo -e "\e[32m1) Install Panel\e[0m"
  echo -e "\e[36m2) Create Panel User\e[0m"
  echo -e "\e[32m3) Update Panel\e[0m"
  echo -e "\e[31m4) Uninstall Panel\e[0m"
  echo -e "\e[31m5) Exit\e[0m"
  echo
  echo -ne "Select Option → "

  read opt

  case $opt in
    1)
      clear
      echo "Installing Panel..."
      sleep 2
      echo "Panel Installed (demo)"
      read -p "Press Enter to return to menu"
      ;;
    2)
      clear
      echo "Creating Panel User..."
      sleep 2
      echo "User Created (demo)"
      read -p "Press Enter to return to menu"
      ;;
    3)
      clear
      echo "Updating Panel..."
      sleep 2
      echo "Panel Updated (demo)"
      read -p "Press Enter to return to menu"
      ;;
    4)
      clear
      echo "Uninstalling Panel..."
      sleep 2
      echo "Panel Removed (demo)"
      read -p "Press Enter to return to menu"
      ;;
    5)
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid option!"
      sleep 1
      ;;
  esac
done
