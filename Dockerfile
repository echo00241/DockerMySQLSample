FROM centos:6.6

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN echo 'NETWORKING=yes' > /etc/sysconfig/network
RUN rpm -ivh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm

RUN yum update -y
RUN yum install -y passwd
RUN yum install -y sudo

RUN yum install -y mysql mysql-server

# supervisor

RUN yum install -y supervisor
RUN echo '[supervisord]' >> /etc/supervisord.conf
RUN echo 'nodaemon=true' >> /etc/supervisord.conf

RUN echo '[program:mysql]' >> /etc/supervisord.conf
RUN echo 'command=service mysqld start' >> /etc/supervisord.conf

RUN mkdir /root/tools/
ADD ./tools/initialize_mysql.bash /root/tools/
RUN chmod +x /root/tools/initialize_mysql.bash
# RUN service mysqld start;/root/tools/initialize_mysql.bash

RUN service mysqld start;/root/tools/initialize_mysql.bash
CMD /usr/bin/supervisord -c /etc/supervisord.conf
