FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    ca-certificates \
    ufw \
    sudo \
    openssh-server \
    curl \
    wget \
    gnupg \
    git \
    nano \
    net-tools \
    iputils-ping \
    dnsutils \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update && apt-get install make

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed -i 's/#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN mkdir /var/run/sshd

WORKDIR /app

RUN echo 'root:root' | chpasswd

EXPOSE 22 80 3306

CMD ["/usr/sbin/sshd", "-D"]
