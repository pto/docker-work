FROM alpine:latest
MAINTAINER Peter Olsen "pto@me.com"

#RUN pacman-key --populate archlinux && \
#    pacman-key --refresh-keys && \
#    pacman -Syu --noconfirm
#
#RUN pacman-db-upgrade && \
#    pacman -S --noconfirm base-devel bc gdb git lsof man-db mlocate \
#						  unzip vim wget && \
#    updatedb 

#RUN apt-get -y update && apt-get -y dist-upgrade && \
#	apt-get install -y autoconf automake bison build-essential \
#		clang curl dc dnsutils flex gdb git libc6-dev libicu-dev libtool \
#		make man-db mlocate net-tools python-dev vim wget && \
#	apt-get clean && updatedb && mandb

#ENV GOLANG_VERSION 1.7.3
#ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
#ENV GOLANG_DOWNLOAD_SHA256 508028aac0654e993564b6e2014bf2d4a9751e3b286661b0b0040046cf18028e

#RUN curl -L "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
#	&& echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
#	&& tar -C /usr/local -xzf golang.tar.gz \
#	&& rm golang.tar.gz

#ENV GOPATH /root/go
#ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

COPY root/ /root/

#RUN mkdir /root/.vim && \
#	git clone https://github.com/fatih/vim-go.git /root/.vim/vim-go

#CMD ["/bin/bash"]
CMD ["/bin/ash"]
ENV ENV=/root/.ashrc
ENV PAGER=less

#RUN apt-get -y update && apt-get -y dist-upgrade
RUN apk update && apk upgrade
RUN apk add binutils binutils-doc build-base curl curl-doc less less-doc \
            man man-pages mdocml-apropos gcc gcc-doc vim vim-doc 
