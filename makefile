docker-build:
	docker build -t lemp_server .
docker-run:
	docker run -it -p 80:80 -p 3306:3306 -p 2222:22 --name LEMP --cap-add=NET_ADMIN lemp_server
setup:
	ufw enable
	ufw allow OpenSSH
	apt-get update
	apt install -y nginx
	ufw allow 'Nginx HTTP'
	apt-get install -y php-fpm php-mysql php-curl php-xml php-gd php-mbstring php-zip php-intl
	apt-get install -y php-cli php-mbstring unzip openssh-server git nano
	apt-get install -y mysql-server
	service mysql restart
	apt-get install -y phpmyadmin
	ln -s /usr/share/phpmyadmin /var/www/html
	sudo nano /etc/nginx/sites-enabled/default
	cp /app/lemp.conf /etc/nginx/sites-enabled/default
	sudo service nginx restart
	nginx -t

	
