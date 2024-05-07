RED := \033[0;31m
BLUE := \033[0;34m
NC := \033[0m

setup-lemp:
	@echo "\n$(RED)Setting up LEMP server\n$(NC)"

	@echo "\n$(BLUE)Installing nginx$(NC)"
	@apt-get update
	@apt-get install -y nginx
	@service nginx start

	@echo "\n$(BLUE)Allowing http traffic through ufw$(NC)"
	@ufw enable
	@ufw allow OpenSSH
	@ufw allow 'Nginx HTTP'

	@echo "\n$(BLUE)Installing php dependencies$(NC)"
	@apt-get install -y \
		php8.3-fpm \
		php8.3-mysql \
		php8.3-curl \
		php8.3-xml \
		php8.3-mbstring \
		php8.3-zip \
		php8.3-intl \
		php8.3-cli \
		php8.3-mbstring
	@service php8.3-fpm start

	@echo "\n$(BLUE)Installing MySQL$(NC)"
	@apt-get install -y mysql-server
	@service mysql start

	@echo "\n$(BLUE)Installing phpMyAdmin$(NC)"
	@echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
	@echo "phpmyadmin phpmyadmin/mysql/admin-pass password password" | debconf-set-selections
	@echo "phpmyadmin phpmyadmin/mysql/app-pass password password" | debconf-set-selections
	@echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
	@apt-get install -y phpmyadmin
	
	@echo "\n$(BLUE)Configuring phpMyAdmin and nginx$(NC)"
	@rm -rf /var/www
	@read -p "Enter project name: " PROJECT_NAME ; \
	read -p "Enter GitHub project repository URL: " REPO_URL ; \
	git clone $$REPO_URL /var/www/$$PROJECT_NAME ; \
	ln -s /usr/share/phpmyadmin /var/www/$$PROJECT_NAME ; \
	cp /app/default /etc/nginx/sites-enabled/default ; \
	sed -i "s/\/var\/www\/html/\/var\/www\/$$PROJECT_NAME/g" /etc/nginx/sites-enabled/default ; \
	
	@echo "\n$(BLUE)Testing nginx$(NC)"
	@nginx -t
	@service nginx restart

	@echo "\n$(BLUE)MySQL Privileges$(NC)"
	@echo "\n$(RED)COPY FROM > mysql.txt$(NC)\n"
	@mysql

	@echo "\n$(BLUE)Updating phpMyAdmin configuration file$(NC)\n"
	@sudo sed -i "s/localhost/127.0.0.1/g" /etc/phpmyadmin/config-db.php
	@nano /etc/phpmyadmin/config-db.php

	
