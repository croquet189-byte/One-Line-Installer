#!/bin/bash
set -e

echo "===================================="
echo " 🚀 Custom Installer Started"
echo "===================================="

# Check root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run as root"
  exit 1
fi

echo "📦 Updating system..."
apt update -y

echo "📦 Installing required packages..."
apt install -y curl wget git sudo

echo "✅ Packages installed"

echo "📁 Creating example directory..."
mkdir -p /opt/myinstaller

echo "🎉 Installation completed successfully!"
echo "===================================="
