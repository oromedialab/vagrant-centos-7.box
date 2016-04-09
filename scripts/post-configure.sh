#!/usr/bin/env bash

# Disable SELINUX
sudo setenforce 0
sudo sed -i 's/SELINUX=\(enforcing\|permissive\)/SELINUX=disabled/g' /etc/selinux/config

# Change Apache DOCUMENT_ROOT and restart apache
sudo sed -i 's#DocumentRoot "/var/www/html"#DocumentRoot "/var/www/html/centos"#g' /etc/httpd/conf/httpd.conf
sudo systemctl start httpd.service
sudo systemctl restart httpd.service
sudo systemctl enable httpd.service