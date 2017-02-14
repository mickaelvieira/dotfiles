# Build

```sh
$ docker build -t composer .
```

# Run

```sh
docker run -it --rm --name composer \
    -v "$(composer --global config data-dir)":/composer \
    -v "$(pwd -P)":/srv \
    composer \
    composer --ansi install
```
