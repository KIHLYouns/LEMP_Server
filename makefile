docker-build:
	@echo "\033[0;31mBuilding docker image\033[0m"
	docker build -t lemp_server_0 .
docker-run:
	@echo "\033[0;35mRunning docker container\033[0m"
	docker run -it -p 80:80 -p 3306:3306 -p 2222:22 --name LEMP_0 --cap-add=NET_ADMIN lemp_server_0 /bin/bash