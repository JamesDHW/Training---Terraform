#!/bin/bash
# The resulting wp installation is NOT SECURE.
# For training purposes only.

sudo yum update -y
sudo amazon-linux-extras enable php8.0
sudo yum clean metadata
sudo yum install php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap} -y

# sudo yum install httpd php-mysql -y
sudo yum install httpd -y # <- change made here (php-mysql already installed)

cd /var/www/html
sudo wget https://wordpress.org/wordpress-5.8.tar.gz
sudo tar -xzf wordpress-5.8.tar.gz
sudo cp -r wordpress/* /var/www/html/
sudo rm -rf wordpress
sudo rm -rf wordpress-5.8.tar.gz
sudo chmod -R 755 ./
sudo chown -R apache:apache ./
sudo service httpd start
sudo chkconfig httpd on