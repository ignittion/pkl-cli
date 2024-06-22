FROM alpine:latest

ARG TARGETPLATFORM
ARG VERSION=0.26.0

RUN apk add --no-cache curl libc6-compat tini \
    && echo $([ "$TARGETPLATFORM" == "linux/amd64" ] && echo "amd64" || echo "aarch64") > /platform

RUN curl -L -o /usr/local/bin/pkl https://github.com/apple/pkl/releases/download/${VERSION}/pkl-linux-$(cat /platform) \
    && chmod +x /usr/local/bin/pkl

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD ["pkl"]
