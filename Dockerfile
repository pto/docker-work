FROM debian:jessie
MAINTAINER Peter Olsen "polsen@gannett.com"

RUN apt-get -yqq update && \
    apt-get -yqq upgrade && \
    apt-get -yqq install dnsutils gcc git libc6-dev make man-db mlocate \
                         mercurial net-tools vim wget && \
    apt-get clean && \
    updatedb

COPY root/ /root/
RUN cat /root/bashrc >>/root/.bashrc && rm /root/bashrc

VOLUME ["/home/pto"]
WORKDIR /home/pto
CMD ["/bin/bash"]
