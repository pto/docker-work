FROM base/archlinux
MAINTAINER Peter Olsen "polsen@gannett.com"

RUN pacman-key --populate archlinux && \
    pacman-key --refresh-keys && \
    pacman -Syu --noconfirm

RUN pacman-db-upgrade && \
    pacman -S --noconfirm base-devel bc gdb git lsof mlocate unzip vim wget && \
    updatedb 

#apt-get -y update && \
#    apt-get -y dist-upgrade && \
#    apt-get -y install dc dnsutils gdb gcc git glibc-doc libc6-dev make \
#                       man-db mlocate net-tools vim wget && \
#    apt-get clean && \
#    updatedb && \
#    mandb

COPY root/ /root/

CMD ["/bin/bash"]

ENV UPDATED 2015-07-06
