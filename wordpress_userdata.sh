#!/bin/bash  
sudo su - 
yum install httpd -y 
yum install epel-release -y 
yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm 
yum-config-manager --enable remi-php74 
yum install php -y 
systemctl restart httpd 
systemctl enable httpd 
yum install wget -y 
wget https://wordpress.org/latest.tar.gz 
tar -xf latest.tar.gz -C /var/www/html/ 
mv /var/www/html/wordpress/* /var/www/html/ 
yum install php-mysql -y 
systemctl restart httpd 
getenforce 
sed 's/SELINUX=permissive/SELINUX=enforcing/g' /etc/sysconfig/selinux -i 
setenforce 0
chown -R apache:apache /var/www/html/
systemctl restart httpd