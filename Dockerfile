FROM debian:sid
MAINTAINER Peter Olsen "polsen@gannett.com"

RUN apt-get -y update && \
    apt-get -y dist-upgrade && \
    apt-get -y install dc dnsutils gdb gcc git glibc-doc libc6-dev make \
                       man-db mlocate net-tools vim wget && \
    apt-get clean && \
    updatedb && \
    mandb

COPY root/ /root/

RUN cat <<EOF >>/root/.bashrc
alias grep="grep --color=auto"
alias ls="ls --color=auto"
EOF

ENV LC_CTYPE=C.UTF-8
ENV PS1="\[\033[01;35m\]docker\[\033[01;34m\] \w \$\[\033[00m\] "
ENV TZ='America/New_York'

CMD ["/bin/bash"]

ENV UPDATED 2015-05-19
