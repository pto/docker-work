FROM debian:sid
MAINTAINER Peter Olsen "polsen@gannett.com"

RUN apt-get -y update && \
    apt-get -y dist-upgrade && \
    apt-get -y install dc dnsutils gdb gcc git glibc-doc libc6-dev make \
                       man-db mlocate mercurial net-tools vim wget && \
    apt-get clean && \
    updatedb && \
	mandb

COPY root/ /root/
RUN cat /root/bashrc >>/root/.bashrc && rm /root/bashrc

ENV LC_CTYPE=C.UTF-8

CMD ["/bin/bash"]

ENV UPDATED 2015-05-10
