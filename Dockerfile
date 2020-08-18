FROM alpine:latest
RUN set -eux; \
    apk add --no-cache ruby ruby-json ruby-etc ruby-bigdecimal sqlite-libs libstdc++; \
    apk add --no-cache --virtual build-deps alpine-sdk ruby-dev sqlite-dev; \
    gem install -N --clear-sources mailcatcher:0.8.0.beta2; \
    apk del build-deps
EXPOSE 1080 1025
ENTRYPOINT ["mailcatcher", "-f", "--ip", "0.0.0.0"]
