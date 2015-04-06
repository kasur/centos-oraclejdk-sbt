FROM kasured/centos-oraclejdk
MAINTAINER Evgeny Rusak "kasured@exadel.com"

RUN yum -y update; yum clean all;

RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo

RUN yum install sbt

CMD ["/bin/bash"]
