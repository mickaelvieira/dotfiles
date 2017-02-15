#### build

```
$ wget https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/docker/yarn/Dockerfile
$ wget https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/docker/yarn/script.sh
$ docker build -t yarn .
```

#### Basic usage

Using the command without any command will print out the libraries version, for instance:

```
$ docker run mickaelvieira/yarn
Yarn 0.20.0
Node v6.9.5
Sass 3.4.23 (Selective Steve)
Cache: /cache
Cwd: /srv
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
