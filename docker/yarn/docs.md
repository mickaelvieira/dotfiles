#### Build

```
$ wget https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/docker/yarn/Dockerfile
$ wget https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/docker/yarn/script.sh
$ docker build -t yarn .
```

#### Pull the image from `Docherhub`

```
$ docker pull mickaelvieira/yarn
```

#### Basic usage

Using the image without any command will print out the libraries version, for instance:

```
$ docker run mickaelvieira/yarn
Yarn 0.20.0
Node v6.9.5
Sass 3.4.23 (Selective Steve)
Cache: /cache
Cwd: /srv
```

#### Map container's cache directory to your local cache directory

For instance, to map the yarn cache directory in the container to your local yarn cache directory.

```
docker run -it --rm -v "$(yarn cache dir)":/cache mickaelvieira/yarn
```

#### Map container's working directory to your local working directory (.ie where is your `package.json`)

```
docker run -it --rm -v "$(pwd -P)":/srv mickaelvieira/yarn
```
