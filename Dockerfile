FROM golang:1.6.2-alpine
MAINTAINER Peter Olsen "pto@me.com"

#RUN pacman-key --populate archlinux && \
#    pacman-key --refresh-keys && \
#    pacman -Syu --noconfirm
#
#RUN pacman-db-upgrade && \
#    pacman -S --noconfirm base-devel bc gdb git lsof man-db mlocate \
#						  unzip vim wget && \
#    updatedb 

#apt-get -y update && \
#    apt-get -y dist-upgrade && \
#    apt-get -y install dc dnsutils gdb gcc git glibc-doc libc6-dev make \
#                       man-db mlocate net-tools vim wget && \
#    apt-get clean && \
#    updatedb && \
#    mandb

RUN apk add --update bash man man-pages

COPY root/ /root/

CMD ["/bin/bash"]
