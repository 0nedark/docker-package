FROM alpine

RUN apk add git
RUN rm -rf /var/cache/apk/* /var/tmp/*/tmp/*

WORKDIR /package
RUN git init \
    && git config --global user.name "package" \
    && git config --global user.email "package@container.com"

COPY version.sh /scripts/version.sh
COPY patch /usr/local/bin/patch
COPY minor /usr/local/bin/minor
COPY major /usr/local/bin/major

ENTRYPOINT [ "sh", "-c", "while [ true ]; do sleep 1d; done" ]
