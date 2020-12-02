FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
        libxcb1-dev \
        libpcre16-3 \
    && rm -r /var/lib/apt/lists/*

RUN wget -q --content-disposition https://minergate.com/download/deb-cli \
    && dpkg -i *.deb \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "cryptocurrencies.miner@gmail.com", "-xmr"]
