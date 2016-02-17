# Hubot on Docker

This is the base docker-image for [hubot](https://hubot.github.com/) instances.

Create your derived docker-image with the following `Dockerfile`:

```docker
# DOCKER-VERSION 1.6.2

FROM kaniabi/hubot
MAINTAINER XXXX, xxxx@xxxx.xxx

ENV HUBOT_PORT 8072
ENV HUBOT_ADAPTER slack
ENV HUBOT_NAME hubot
ENV HUBOT_GOOGLE_API_KEY xxxxxxxxxxxxxxxxxxxxxx
ENV HUBOT_SLACK_TOKEN xxxxxxxxxxxxxxxxxxxxxx
ENV HUBOT_SLACK_TEAM xxxxx
ENV HUBOT_SLACK_BOTNAME ${HUBOT_NAME}
ENV PORT ${HUBOT_PORT}

EXPOSE ${HUBOT_PORT}

CMD bin/hubot --adapter slack
```

# TODO:

Dockerfile for configuring [kaniabi/hubot](https://registry.hub.docker.com/u/kaniabi/hubot/).

## Deployment Steps

1. `docker pull kaniabi/hubot`
2. `git clone git@github.com:kaniabi/bot-cfg.git`
3. `vi ./bot-cfg/Dockerfile` (configure `ENV`s)
4. `docker build -t="kaniabi/hubot:live" ./bot-cfg/`
5. `docker run -d -p PORT kaniabi/hubot:live`
6. Add public Hubot address to Slack Integration (i.e. http://2.2.2.2:45678/)
