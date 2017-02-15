#### build

```
$ wget https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/docker/yarn/Dockerfile
$ wget https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/docker/yarn/script.sh
$ docker build -t yarn .
```

#### Map cache directory to a local cache directory

For instance, to map the yarn cache directory in the container to your local yarn cache directory.

```
docker run -it --rm -v "$(yarn cache dir)":/cache mickaelvieira/yarn
```

#### Map working directory to a local working directory

```
docker run -it --rm -v "$(pwd -P)":/srv mickaelvieira/yarn
```

#### Basic usage

```
docker run -it --rm -v "$(pwd -P)":/srv mickaelvieira/yarn yarn install
```
