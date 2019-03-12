# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.11

CMD ["/sbin/my_init"]

# ...put your own build instructions here...

RUN apt-get update && apt-get install -y iputils-ping telnet-ssl dnsutils

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD exec /bin/sh -c "trap : TERM INT; while true; do sleep 86400; done & wait"
