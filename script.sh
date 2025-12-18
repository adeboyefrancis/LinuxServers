# Configuration Drift Prevention Script for LAMP Stack Installation
#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive

echo "[1/6] Updating apt package list..."
sudo apt-get update -y

echo "[2/6] Installing Apache if missing..."
if ! command -v apache2 >/dev/null 2>&1; then
    sudo apt-get install -y apache2
    sudo systemctl enable apache2
else
    echo "Apache already installed."
fi

echo "[3/6] Installing MySQL if missing..."
if ! command -v mysql >/dev/null 2>&1; then
    sudo apt-get install -y mysql-server
    sudo systemctl enable mysql
else
    echo "MySQL already installed."
fi

echo "[4/6] Installing PHP + extensions if missing..."
if ! command -v php >/dev/null 2>&1; then
    sudo apt-get install -y php libapache2-mod-php php-mysql \
        php-cli php-curl php-zip php-mbstring php-xml
else
    echo "PHP already installed."
fi

echo "[5/6] Restarting Apache to apply PHP modules..."
sudo systemctl restart apache2

echo "[6/6] Creating /var/www/html/info.php if missing..."
FILE=/var/www/html/info.php
if [ ! -f "$FILE" ]; then
    echo "<?php phpinfo(); ?>" | sudo tee "$FILE" >/dev/null
    echo "info.php created."
else
    echo "info.php already exists — leaving it untouched."
fi

echo "-------------------------------------------------"
echo "LAMP stack installation complete and idempotent."
echo "Re-running this script will not duplicate actions."
echo "-------------------------------------------------"
