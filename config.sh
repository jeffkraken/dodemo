#!/bin/bash

# Step 1: Start and enable Apache
echo "Starting and enabling Apache (httpd)..."
sudo systemctl start httpd
sudo systemctl enable httpd

# Step 2: Start and enable firewalld
echo "Starting and enabling firewalld..."
sudo systemctl start firewalld
sudo systemctl enable firewalld

# Step 3: Clone your GitHub repository
echo "Backing up default Apache web root..."
sudo mv /var/www/html /var/www/html.bak

echo "Cloning GitHub repository into /var/www/html..."
sudo git clone https://github.com/jeffkraken/dodemo.git /var/www/html

# Step 4: Adjust permissions
echo "Setting ownership and permissions..."
sudo chown -R apache:apache /var/www/html
sudo chmod -R 755 /var/www/html

# Step 5: Open the firewall for HTTP traffic
echo "Opening HTTP service in the firewall..."
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

echo "Setup complete. Using a web browser like FireFox or Chrome, browse to the VM's IP Address now."
