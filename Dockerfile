FROM python:alpine

ENV REVIEWDOG_VERSION=v0.11.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION} \
 && apk --no-cache add git \
 && pip install yamllint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
