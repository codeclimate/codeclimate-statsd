# codeclimate-statsd

Dockerized version of statsd with librato backend.

# Instructions

1. Build the image as per usual:

    $ docker build -t codeclimate/statsd .

2. Run the image supplying a statsd configuration file mounted into the container

    $ docker run -d -v /path/to/config.js:/data/config.js codeclimate/statsd
