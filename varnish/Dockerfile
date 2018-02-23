FROM debian:8

RUN apt-get update && apt-get install -y \
    wget \
    pkg-config \
    libpcre3-dev \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

ENV VARNISH_VERSION="2.1.5"
ENV VARNISH_DIGEST="2d8049be14ada035d0e3a54c2b519143af40d03d917763cf72d53d8188e5ef83"

WORKDIR /tmp
RUN ( wget https://varnish-cache.org/_downloads/varnish-$VARNISH_VERSION.tgz )&& \
  echo "$VARNISH_DIGEST varnish-2.1.5.tgz" > SHA256SUMS && \
  sha256sum -c SHA256SUMS 2>&1 | grep OK && \
  tar -xvzf varnish-$VARNISH_VERSION.tgz && \
  mv varnish-$VARNISH_VERSION /usr/local/varnish
WORKDIR /usr/local/varnish
RUN ./configure && make && make install
ENV LD_LIBRARY_PATH=/usr/local/lib

COPY default.vcl /usr/local/varnish/etc/default.vcl
COPY ./cmd.sh /cmd.sh

CMD /cmd.sh
