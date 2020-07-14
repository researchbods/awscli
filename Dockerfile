FROM alpine:3.12
MAINTAINER Telyn

RUN apk --update --no-cache add \
    python3 \
    py3-pip \
    jq \
    bash \
    git \
    groff \
    less \
    mailcap \
    bash \
    docker-compose \
    && pip install --no-cache-dir awscli \
    && apk del py-pip \
    && rm -rf /var/cache/apk/* /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "aws" ]
CMD ["--version"]
