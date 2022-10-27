FROM ubuntu:latest

RUN apt-get update && apt-get install -y openssh-server vim  iputils-ping
RUN mkdir /var/run/sshd
COPY ssh /root/.ssh
RUN cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
RUN echo 'root:mypassword' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
WORKDIR /root
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
