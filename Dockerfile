FROM kasured/centos-oraclejdk
MAINTAINER Evgeny Rusak "kasured@exadel.com"

ENV SBT_V 0.13.8

#installing git
RUN yum -y update; yum clean all; yum -y install git;

WORKDIR /opt

# Try to install sbt without deps java-devel this is already in the dep image
RUN curl -O -L http://dl.bintray.com/sbt/rpm/sbt-$SBT_V.rpm 
RUN rpm -ivh sbt-$SBT_V.rpm --nodeps

WORKDIR /

# run sbt while creating the image as it will speed up running the container afterwards
RUN sbt help

CMD ["/bin/bash"]
