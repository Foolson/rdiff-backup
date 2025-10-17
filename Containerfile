FROM debian:stable

ENV SSH_USER="rdiff-backup"
ENV DEBIAN_FRONTEND=noninteractive
ENV AUTHORIZED_KEYS=""

RUN apt-get update
RUN apt-get install -y openssh-server rdiff-backup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /backup

COPY entrypoint.sh /

EXPOSE 22

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D", "-e"]
