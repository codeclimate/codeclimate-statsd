FROM mhart/alpine-node:6.10.1

WORKDIR /root/

RUN apk --update add git && \
    git clone https://github.com/etsy/statsd.git && \
    cd statsd && git reset --hard v0.7.2 && \
    apk del git && \
    npm install \
      aws-cloudwatch-statsd-backend@1.2.0 \
      statsd-librato-backend@0.1.7 \
      statsd-datadog-backend@0.1.0


WORKDIR /root/statsd

CMD ["node", "stats.js", "/etc/config.js"]
