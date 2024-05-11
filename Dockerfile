FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    make \
    ufw \
    sudo \
    curl \
    git \
    nano \
    net-tools \
    iputils-ping \
    dnsutils \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app

EXPOSE 80 3306