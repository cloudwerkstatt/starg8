FROM centos:7
MAINTAINER Udo Urbantschitsch <udo.urbantschitsch@cloudwerkstatt.com>

RUN yum install tftp-server syslinux httpd dhcp -y
RUN mkdir /tftpboot \
    && cp /usr/share/syslinux/pxelinux.0 /tftpboot/ \
    && cp /usr/share/syslinux/menu.c32 /tftpboot/ \
    && cp /usr/share/syslinux/memdisk /tftpboot/ \
    && cp /usr/share/syslinux/mboot.c32 /tftpboot/ \
    && cp /usr/share/syslinux/chain.c32 /tftpboot/ \
    && mkdir /tftpboot/pxelinux.cfg

COPY tftp /etc/xinetd.d/
COPY dhcpd.conf /etc/dhcp/

ENTRYPOINT /bin/bash
