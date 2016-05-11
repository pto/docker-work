FROM ubuntu:latest
MAINTAINER Peter Olsen "pto@me.com"

#RUN pacman-key --populate archlinux && \
#    pacman-key --refresh-keys && \
#    pacman -Syu --noconfirm
#
#RUN pacman-db-upgrade && \
#    pacman -S --noconfirm base-devel bc gdb git lsof man-db mlocate \
#						  unzip vim wget && \
#    updatedb 

RUN apt-get -y update && apt-get -y dist-upgrade && \
	apt-get install -y autoconf automake bison build-essential \
		curl dc dnsutils flex gdb git libc6-dev libtool make man-db \
		mlocate net-tools vim wget && \
	apt-get clean && updatedb && mandb

ENV GOLANG_VERSION 1.6.2
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 e40c36ae71756198478624ed1bb4ce17597b3c19d243f3f0899bb5740d56212a

RUN curl -L "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
	&& echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
	&& tar -C /usr/local -xzf golang.tar.gz \
	&& rm golang.tar.gz

ENV GOPATH /root/go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

COPY root/ /root/

CMD ["/bin/bash"]
