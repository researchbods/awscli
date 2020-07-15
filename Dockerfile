FROM alpine:3.12
MAINTAINER Telyn

RUN apk --update --no-cache add \
    bash \
    bash \
    docker-compose \
    git \
    groff \
    jq \
    less \
    mailcap \
    py3-pip \
    python3 \
    ssh \
    && pip install --no-cache-dir awscli \
    && apk del py-pip \
    && rm -rf /var/cache/apk/* /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "aws" ]
CMD ["--version"]
