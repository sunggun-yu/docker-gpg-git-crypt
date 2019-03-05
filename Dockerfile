FROM debian
MAINTAINER Sunggun Yu <sunggun.dev@gmail.com>
ENV GIT_CRYPT_VERSION 0.6.0-1
RUN apt-get update \
    && apt-get install -y \
      g++ \
      make \
      curl \
      gnupg \
      gnupg-agent \
      openssl \
      libssl-dev \
      git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /tmp/git-crypt \
    && curl -L https://github.com/AGWA/git-crypt/archive/debian/$GIT_CRYPT_VERSION.tar.gz | tar zxv -C /tmp/git-crypt
RUN cd /tmp/git-crypt/git-crypt-debian-$GIT_CRYPT_VERSION \
    && make \
    && make install PREFIX=/usr/local \
    && rm -rf /tmp/git-crypt
CMD ["/bin/sh"]
