setup-lemp:
	@echo "\033[0;31mSetting up LEMP server\033[0m\n"

	@echo "\n\033[0;34mEnabling ufw and allowing OpenSSH\033[0m"
	ufw enable
	ufw allow OpenSSH

	@echo "\n\033[0;34mUpdating apt cache\033[0m"
	apt-get update

	@echo "\n\033[0;34mInstalling nginx\033[0m"
	apt-get install -y nginx

	@echo "\n\033[0;34mAllowing http traffic through ufw\033[0m"
	ufw allow 'Nginx HTTP'

	@echo "\n\033[0;34mStarting nginx\033[0m"
	service nginx start

	@echo "\n\033[0;34mInstalling php dependencies\033[0m"
	apt-get install -y \
		php8.3-fpm \
		php8.3-mysql \
		php8.3-curl \
		php8.3-xml \
		php8.3-mbstring \
		php8.3-zip \
		php8.3-intl \
		php8.3-cli \
		php8.3-mbstring \
		openssh-server \
		git \
		nano 
	@echo "\n\033[0;34mStarting php-fpm\033[0m"
	service php8.3-fpm start

	@echo "\n\033[0;34mInstalling MySQL\033[0m"
	apt-get install -y mysql-server

	@echo "\n\033[0;34mStarting MySQL\033[0m"
	service mysql start

	@echo "\n\033[0;34mInstalling phpMyAdmin\033[0m"
	apt-get install -y phpmyadmin

	@echo "\n\033[0;34mCreating symlink for phpMyAdmin\033[0m"
	ln -s /usr/share/phpmyadmin /var/www/html

	@echo "\n\033[0;34mCopying nginx configuration\033[0m"
	cp /app/default /etc/nginx/sites-enabled/default

	@echo "\n\033[0;34mTesting nginx configuration\033[0m"
	nginx -t
	
	@echo "\n\033[0;34mRestarting nginx\033[0m"
	service nginx restart

	@echo "\n\033[0;34mMySQL Privileges\033[0m"
	@echo "\033[0;32mUSE - mysql.txt\033[0m"
	mysql

	@echo "\n\033[0;34mUpdating phpMyAdmin configuration file\033[0m"
	sed -i "s/\$dbserver='localhost';/\$dbserver='127.0.0.1';/" /etc/phpmyadmin/config-db.php



	
	

	
