FROM alpine:edge

RUN apk --update add nodejs git
WORKDIR /root/

RUN git clone https://github.com/etsy/statsd.git && \
    cd statsd && git reset --hard v0.7.2 && \
    apk del git && \
    npm install statsd-librato-backend

WORKDIR /root/statsd

CMD ["node", "stats.js", "/etc/config.js"]
