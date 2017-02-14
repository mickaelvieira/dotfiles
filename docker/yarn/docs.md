# Build

```sh
$ docker build -t yarn .
```

# Run

```sh
docker run -it --rm --name yarn \
    -v "$(yarn cache dir)":/cache \
    -v "$(pwd -P)":/srv \
    yarn
```
