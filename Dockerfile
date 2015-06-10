FROM alpine:edge

RUN apk --update add nodejs git
WORKDIR /root/

RUN git clone https://github.com/etsy/statsd.git && \
    cd statsd && git reset --hard v0.7.2 && \
    npm install statsd-librato-backend

WORKDIR /root/statsd

ENTRYPOINT ["node", "stats.js"]
