FROM ubuntu:latest

RUN apt-get update; \
    apt-get install -y python3 python3-pip wget openssh-client iputils-ping



RUN pip3 install --upgrade pip; \
    python3 -m pip install ansible

# RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
# USER ubuntu
# Add the keys and set permissions
COPY ssh /root/.ssh
RUN chmod 600 /root/.ssh/id_rsa && \
    chmod 644 /root/.ssh/id_rsa.pub
WORKDIR /root