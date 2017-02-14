FROM alpine:3.5

RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main' > /etc/apk/repositories && \
    echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

RUN apk add --no-cache \
    curl \
    git \
    ca-certificates \
    ruby \
    yarn

RUN gem install sass --no-document
RUN yarn config set cache-folder /cache

WORKDIR /srv

COPY script.sh /root/script.sh

RUN chmod u+x /root/script.sh

CMD /bin/sh -c /root/script.sh
