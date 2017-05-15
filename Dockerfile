FROM alpine:edge

RUN apk --update add nodejs git
WORKDIR /root/

RUN git clone https://github.com/etsy/statsd.git && \
    cd statsd && git reset --hard v0.7.2 && \
    npm install \
      codeclimate/aws-cloudwatch-statsd-backend#a3981840 \
      statsd-librato-backend@0.1.7 \
      statsd-datadog-backend@0.1.0 && \
    apk del git


WORKDIR /root/statsd

CMD ["node", "stats.js", "/etc/config.js"]
