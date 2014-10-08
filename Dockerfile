FROM centos
MAINTAINER Peter Olsen "polsen@gannett.com"

ENV YUM_UPDATED "2014-10-08"

RUN yum -y -q update && \
    yum -y -q install man mlocate net-tools vim && \
    updatedb

CMD ["/bin/bash"]
