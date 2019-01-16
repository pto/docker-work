FROM alpine:latest
MAINTAINER Peter Olsen "pto@me.com"

COPY root/ /root/
CMD ["/bin/bash"]
ENV ENV=/root/.bashrc
ENV PAGER=less
RUN apk update && apk upgrade && \
    apk add bash bash-doc binutils binutils-doc build-base ca-certificates \
    curl curl-doc less less-doc man man-pages mdocml-apropos \
    gcc gcc-doc gdb gdb-doc vim vim-doc
