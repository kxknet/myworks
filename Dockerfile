FROM debian:jessie

MAINTAINER MirHosting <support@ddosov.net>

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
COPY genkeys.sh /usr/local/src/genkeys.sh

RUN chmod +x /usr/local/src/postinstall.sh
RUN chmod +x /usr/local/src/tuning.sh
RUN chmod +x /usr/local/src/genkeys.sh
RUN apt-get remove exim4 exim4-base exim4-config exim4-daemon-light -y
RUN apt-get purge exim4 exim4-base exim4-config exim4-daemon-light -y
RUN rm -rf /etc/init.d/apache2


EXPOSE 21 22 25 53 80 110 143 443 465 1500 3306
