RED := \033[0;31m
BLUE := \033[0;34m
GREEN := \033[0;32m
NC := \033[0m

setup-install:
	@echo "\n$(RED)Setting up LEMP server$(NC)"

	@echo "\n$(BLUE)Installing nginx...$(NC)"
	@apt-get update > /dev/null 2>&1
	@apt-get install -y nginx > /dev/null 2>&1
	@service nginx start > /dev/null 2>&1
	@echo "$(GREEN)Done$(NC)"

	@echo "\n$(BLUE)Allowing http traffic through ufw$(NC)"
	@ufw enable > /dev/null 2>&1
	@ufw allow OpenSSH > /dev/null 2>&1
	@ufw allow 'Nginx HTTP' > /dev/null 2>&1
	@echo "$(GREEN)Done$(NC)"

	@echo "\n$(BLUE)Installing php dependencies...$(NC)"
	@apt-get install -y \
		php8.3-fpm \
		php8.3-mysql \
		php8.3-curl \
		php8.3-xml \
		php8.3-mbstring \
		php8.3-zip \
		php8.3-intl \
		php8.3-cli \
		php8.3-mbstring > /dev/null 2>&1
	@service php8.3-fpm start > /dev/null 2>&1
	@echo "$(GREEN)Done$(NC)"

	@echo "\n$(BLUE)Installing MySQL...$(NC)"
	@apt-get install -y mysql-server > /dev/null 2>&1
	@service mysql start > /dev/null 2>&1
	@echo "$(GREEN)Done$(NC)"

	@echo "\n$(BLUE)Installing phpMyAdmin...$(NC)"
	@echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections > /dev/null 2>&1
	@echo "phpmyadmin phpmyadmin/mysql/admin-pass password password" | debconf-set-selections > /dev/null 2>&1
	@echo "phpmyadmin phpmyadmin/mysql/app-pass password password" | debconf-set-selections > /dev/null 2>&1
	@echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections > /dev/null 2>&1
	@apt-get install -y phpmyadmin > /dev/null 2>&1
	@echo "$(GREEN)Done$(NC)"
	
setup-config:
	@echo "\n$(RED)Configuring LEMP server$(NC)"

	@echo "\n$(BLUE)Configuring phpMyAdmin and nginx$(NC)"
	@rm -rf /var/www > /dev/null 2>&1
	@read -p "Enter project name: " PROJECT_NAME ; \
	read -p "Enter GitHub project repository URL: " REPO_URL ; \
	git clone $$REPO_URL /var/www/$$PROJECT_NAME > /dev/null 2>&1 ; \
	ln -s /usr/share/phpmyadmin /var/www/$$PROJECT_NAME > /dev/null 2>&1 ; \
	cp /app/default /etc/nginx/sites-enabled/default > /dev/null 2>&1 ; \
	sed -i "s/\/var\/www\/html/\/var\/www\/$$PROJECT_NAME/g" /etc/nginx/sites-enabled/default > /dev/null 2>&1 
	@echo "$(GREEN)Done$(NC)"
	
	@echo "\n$(BLUE)Testing nginx$(NC)"
	@nginx -t > /dev/null 2>&1
	@service nginx restart > /dev/null 2>&1
	@echo "$(GREEN)Done$(NC)"

	@echo "\n$(BLUE)Updating phpMyAdmin configuration file$(NC)"
	@sudo sed -i "s/localhost/127.0.0.1/g" /etc/phpmyadmin/config-db.php > /dev/null 2>&1
	@echo "$(GREEN)Done$(NC)"

	@echo "\n$(BLUE)Setting MySQL Privileges$(NC)"
	@mysql < mysql.txt > /dev/null 2>&1
	@echo "$(GREEN)Done$(NC)"

setup-lemp: setup-install setup-config
	@echo "\n$(RED)LEMP server setup complete$(NC)\n"
