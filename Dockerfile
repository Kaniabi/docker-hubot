# DOCKER-VERSION    1.6.2

FROM mhart/alpine-node
MAINTAINER Alexandre Andrade, kaniabi@gmail.com

ENV WORKDIR /usr/src/app
WORKDIR ${WORKDIR}
ADD . ${WORKDIR}
