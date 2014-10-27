FROM debian:jessie
MAINTAINER Peter Olsen "polsen@gannett.com"

RUN apt-get -yqq update && \
    apt-get -yqq upgrade 

RUN apt-get -yqq install apt-file build-essential dnsutils git \
                         libacl1-dev libcap-dev man-db mercurial \
                         mlocate net-tools procps vim wget && \
    updatedb && \
    apt-file update

ENV GOROOT /usr/local/go
ENV GOPATH /root/go
RUN cd /usr/local && \
    curl https://storage.googleapis.com/golang/go1.3.3.src.tar.gz | tar xz && \
    cd go/src && \
    ./make.bash && \
    /usr/local/go/bin/go get code.google.com/p/go.tools/cmd/godoc

COPY root/ /root/
RUN cat /root/bashrc >>/root/.bashrc && rm /root/bashrc

CMD ["/bin/bash"]

#ENV APT_GET_UPDATED "2014-10-27"
#RUN apt-get -yqq update && \
#    apt-get -yqq upgrade 

