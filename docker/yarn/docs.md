# Build

```sh
$ docker build -t yarn .
```

# Run

```sh
docker run -it --rm --name yarn \
    -v /path/to/cache:/usr/local/share/.cache/yarn \
    -v "$(pwd -P)":/src \
    yarn
```
