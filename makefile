RED := \033[0;31m
PURPLE := \033[0;35m
GREEN := \033[0;32m
NC := \033[0m

docker-build:
	@echo "$(RED)Building docker image$(NC)"
	docker build -t lemp_server .
docker-run:
	@echo "$(PURPLE)Running docker container$(NC)"
	docker run -it -v /Users/youns/Documents/LEMP_Server/cfg:/app -v /Users/youns/Documents/LEMP_Server/sql:/var/lib/mysql \
	-p 80:80 -p 3306:3306 -p 2222:22 \
	--name LEMP --cap-add=NET_ADMIN lemp_server \
	/bin/bash
t:
	@echo "$(GREEN)Running a bash inside the container$(NC)"
	docker exec -it LEMP /bin/bash