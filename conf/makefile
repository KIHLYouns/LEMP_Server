setup-lemp:
	@echo "\033[0;31mSetting up LEMP server\033[0m\n"

	@echo "\n\033[0;34mEnabling ufw and allowing OpenSSH\033[0m\n"
	ufw enable
	ufw allow OpenSSH

	@echo "\n\033[0;34mUpdating apt cache\033[0m\n"
	apt-get update

	@echo "\n\033[0;34mInstalling nginx\033[0m\n"
	apt-get install -y nginx

	@echo "\n\033[0;34mAllowing http traffic through ufw\033[0m\n"
	ufw allow 'Nginx HTTP'

	@echo "\n\033[0;34mStarting nginx\033[0m\n"
	service nginx start

	@echo "\n\033[0;34mInstalling php dependencies\033[0m\n"
	apt-get install -y \
		php-fpm \
		php-mysql \
		php-curl \
		php-xml \
		php-gd \
		php-mbstring \
		php-zip \
		php-intl \
		php-cli \
		php-mbstring \
		unzip \
		openssh-server \
		git \
		nano 
	@echo "\n\033[0;34mStarting php-fpm\033[0m\n"
	service php8.3-fpm start

	@echo "\n\033[0;34mInstalling MySQL\033[0m\n"
	apt-get install -y mysql-server

	@echo "\n\033[0;34mStarting MySQL\033[0m\n"
	service mysql start

	@echo "\n\033[0;34mInstalling phpMyAdmin\033[0m\n"
	apt-get install -y phpmyadmin

	@echo "\n\033[0;34mCreating symlink for phpMyAdmin\033[0m\n"
	ln -s /usr/share/phpmyadmin /var/www/html

	@echo "\n\033[0;34mCopying default nginx configuration\033[0m\n"
	cp /app/default /etc/nginx/sites-enabled/default

	@echo "\n\033[0;34mTesting nginx configuration\033[0m\n"
	nginx -t
	
	@echo "\n\033[0;34mRestarting nginx\033[0m\n"
	service nginx restart

	@echo "\n\033[0;34mUpdating phpMyAdmin configuration file\033[0m\n"
	sed -i "s/\$dbserver='localhost';/\$dbserver='127.0.0.1';/" /etc/phpmyadmin/config-db.php

	@echo "\n\033[0;34mMySQL Privileges\033[0m\n"
	@echo "\033[0;32mUSE - mysql.txt\033[0m\n"
	mysql



	
	

	
