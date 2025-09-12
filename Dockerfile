FROM alpine:latest

ARG TARGETARCH

RUN apk add --no-cache curl libc6-compat tini

COPY pkl-linux-* /tmp/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN mv /tmp/pkl-linux-${TARGETARCH} /usr/local/bin/pkl \
    && rm -rf /tmp/* \
    && chmod +x /usr/local/bin/pkl /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["pkl"]
