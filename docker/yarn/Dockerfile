FROM alpine:3.5

RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main' > /etc/apk/repositories && \
    echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

RUN apk add --no-cache \
    curl \
    git \
    ca-certificates \
    curl \
    git \
    ca-certificates \
    ruby \
    yarn

RUN gem install sass --no-document

WORKDIR /srv

CMD echo "Yarn $(yarn version), Node $(node -v), $(sass -v), Cache: $(yarn cache dir)"

# docker build -t yarn .

#docker run -it --rm --name yarn \
#-v /Users/mickaelv/Development/docker-data/yarn-cache:/usr/local/share/.cache/yarn \
#-v "$(pwd -P)":/src \
#yarn yarn install
