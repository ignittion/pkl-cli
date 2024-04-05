FROM alpine:latest

ARG VERSION=0.25.2

RUN apk add --no-cache curl libc6-compat tini

RUN curl -L -o /usr/local/bin/pkl https://github.com/apple/pkl/releases/download/${VERSION}/pkl-alpine-linux-amd64 \
    && chmod +x /usr/local/bin/pkl

#COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD ["pkl"]
