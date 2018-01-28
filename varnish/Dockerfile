FROM debian:8

RUN apt-get update && apt-get install -y \
    varnish \
 && rm -rf /var/lib/apt/lists/*

COPY default.vcl /etc/varnish/default.vcl
COPY ./cmd.sh /cmd.sh

CMD /cmd.sh
