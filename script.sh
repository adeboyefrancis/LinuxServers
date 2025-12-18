# Install LAMP stack on Ubuntu 22.04
#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive

# Update system
sudo apt-get update -y

# Install Apache
sudo apt-get install -y apache2
sudo systemctl enable apache2

# Install MySQL
sudo apt-get install -y mysql-server
sudo systemctl enable mysql

# Install PHP and extensions
sudo apt-get install -y php libapache2-mod-php php-mysql php-cli php-curl php-zip php-mbstring php-xml

# Restart Apache after PHP module install
sudo systemctl restart apache2

# Create PHP info page (for dev only)
if [ ! -f /var/www/html/info.php ]; then
    echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
fi

# Echo completion message
echo "LAMP installation complete."
