# Build

```
$ wget https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/docker/composer/Dockerfile
$ wget https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/docker/composer/script.sh
$ docker build -t composer .
```

#### Map cache directory to a local cache directory

For instance, to map the composer cache directory in the container to your local composer cache directory.

```
docker run -it --rm -v "$(composer --global config data-dir)":/cache mickaelvieira/composer
```

#### Map working directory to a local working directory

```
docker run -it --rm -v "$(pwd -P)":/srv mickaelvieira/composer
```

#### Basic usage

```
docker run -it --rm -v "$(pwd -P)":/srv mickaelvieira/composer composer install
```
