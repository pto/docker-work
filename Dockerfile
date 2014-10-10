FROM debian:latest
MAINTAINER Peter Olsen "polsen@gannett.com"

ENV APT_GET_UPDATED "2014-10-09"

RUN apt-get -yqq update && \
    apt-get -yqq upgrade 

RUN apt-get -yqq install apt-file build-essential dnsutils man-db \
                         mlocate net-tools vim && \
    updatedb && \
    apt-file update

CMD ["/bin/bash"]
