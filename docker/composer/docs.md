# Build

```sh
$ docker build -t composer .
```

# Run

```sh
docker run -it --rm --name yarn \
    -v /path/to/cache:/root/.composer \
    -v "$(pwd -P)":/src \
    composer install
```
