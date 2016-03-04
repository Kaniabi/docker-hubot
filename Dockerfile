FROM mhart/alpine-node
MAINTAINER Alexandre Andrade <kaniabi@gmail.com>

ENV WORKDIR="/usr/src/app" HUBOT_NAME="gir" HUBOT_ADAPTER="slack" HUBOT_SLACK_BOTNAME="${HUBOT_NAME}" PORT="HUBOT_PORT"
WORKDIR $WORKDIR
ADD . $WORKDIR

# Expose TZ which sets the timezone for the image.
ENV TIMEZONE America/Sao_Paulo
RUN apk add --no-cache tzdata \
  && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
  && echo ${TIMEZONE} > /etc/timezone \
  && apk del tzdata

EXPOSE 8072

CMD bin/hubot --adapter ${HUBOT_ADAPTER}
