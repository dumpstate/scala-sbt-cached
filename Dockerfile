FROM debian:jessie

RUN apt-get update && \
    apt-get install -y software-properties-common apt-transport-https

RUN add-apt-repository "deb http://http.debian.net/debian jessie-backports main" && \
    add-apt-repository "deb https://dl.bintray.com/sbt/debian /" && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk sbt

WORKDIR /opt/dummy

RUN mkdir project

COPY build.sbt ./
COPY project/build.properties project/plugins.sbt ./project/

RUN sbt update
