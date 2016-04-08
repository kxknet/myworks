FROM debian:jessie

MAINTAINER ddosov.net <support@ddosov.net>

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get -y install bsdmainutils
RUN apt-get -y install openssh-server

RUN apt-get -y update
RUN apt-get --reinstall install bsdutils

COPY postinstall.sh /usr/local/src/postinstall.sh
COPY tuning.sh /usr/local/src/tuning.sh
COPY sshd_config /etc/ssh/sshd_config
COPY ssh_key_hack.sh /etc/init.d/ssh_key_hack.sh
COPY dhcpv6_hack.sh /etc/init.d/dhcpv6_hack.sh
COPY resolv.conf /etc/resolv.conf
COPY jelinit /etc/init.d/jelinit
COPY genkeys.sh /usr/local/src/genkeys.sh

RUN chmod +x /usr/local/src/postinstall.sh
RUN chmod +x /usr/local/src/tuning.sh
RUN chmod +x /usr/local/src/genkeys.sh
RUN apt-get -y remove exim4 exim4-base exim4-config exim4-daemon-light
RUN apt-get -y purge exim4 exim4-base exim4-config exim4-daemon-light
RUN rm -rf /etc/init.d/apache2


EXPOSE 21 22 25 53 80 110 143 443 465 1500 3306
