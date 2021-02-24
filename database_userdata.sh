#!/bin/bash
yum install mariadb-server mysql -y
systmctl start mariadb
systmctl enable mariadb