FROM debian:jessie
MAINTAINER Peter Olsen "polsen@gannett.com"

ENV APT_GET_UPDATED "2014-10-11"

RUN apt-get -yqq update && \
    apt-get -yqq upgrade 

RUN apt-get -yqq install apt-file build-essential dnsutils git man-db \
                         mercurial mlocate net-tools procps vim wget && \
    updatedb && \
    apt-file update

WORKDIR /usr/local
RUN wget https://storage.googleapis.com/golang/go1.3.3.src.tar.gz && \
	tar xfz go1.3.3.src.tar.gz
WORKDIR go/src
RUN ./make.bash && rm ../../go1.3.3.src.tar.gz
WORKDIR /root
ENV GOROOT /usr/local/go
ENV GOPATH /root/go
RUN /usr/local/go/bin/go get code.google.com/p/go.tools/cmd/godoc

COPY gitconfig /root/.gitconfig
COPY vimrc /root/.vimrc
COPY bashrc /root/bashrc
RUN cat /root/bashrc >>/root/.bashrc && rm /root/bashrc

CMD ["/bin/bash"]

RUN apt-get -yqq install libcap-dev
