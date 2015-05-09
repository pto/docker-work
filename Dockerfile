FROM debian:sid
MAINTAINER Peter Olsen "polsen@gannett.com"

RUN apt-get -yqq update && \
    apt-get -yqq upgrade && \
    apt-get -yqq install dc dnsutils gdb gcc git glibc-doc libc6-dev make \
                         man-db mlocate mercurial net-tools vim wget && \
    apt-get clean && \
    updatedb

COPY root/ /root/
RUN cat /root/bashrc >>/root/.bashrc && rm /root/bashrc

CMD ["/bin/bash"]
