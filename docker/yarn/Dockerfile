FROM alpine:3.5

WORKDIR /srv

RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main' > /etc/apk/repositories \
 && echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
 && echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
 && apk add --no-cache \
    curl \
    git \
    ca-certificates \
    ruby \
    yarn \
 && gem install sass --no-document \
 && yarn config set cache-folder /cache

COPY script.sh /root/script.sh

RUN chmod u+x /root/script.sh

CMD /bin/sh -c /root/script.sh
