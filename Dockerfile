FROM centos:latest

MAINTAINER cousins <bkasodariya@gmail.com> 

RUN yum update -y

RUN yum install -y wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm

RUN rpm -ivh jdk-8u11-linux-x64.rpm && rm jdk-8u11-linux-x64.rpm

RUN yum install -y rsync

RUN yum update -y && yum install -y unzip

RUN curl -O https://downloads.typesafe.com/typesafe-activator/1.3.12/typesafe-activator-1.3.12.zip

RUN unzip typesafe-activator-1.3.12.zip -d / && rm typesafe-activator-1.3.12.zip && chmod a+x /activator-dist-1.3.12/bin/activator

ENV PATH $PATH:/activator-dist-1.3.12/bin

EXPOSE 9000 8888 

RUN mkdir /app

WORKDIR /app

CMD ["activator", "run"]