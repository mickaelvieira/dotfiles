#### Build

```
$ wget https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/docker/composer/Dockerfile
$ wget https://raw.githubusercontent.com/mickaelvieira/dotfiles/master/docker/composer/script.sh
$ docker build -t composer .
```

#### Pull the image from `Docherhub`

```
$ docker pull mickaelvieira/composer
```

#### Basic usage

Using the image without any command will print out the libraries version, for instance:

```
$ docker run mickaelvieira/composer
PHP 7.0.15 (cli) (built: Jan 19 2017 21:43:38) ( NTS )
Copyright (c) 1997-2017 The PHP Group
Zend Engine v3.0.0, Copyright (c) 1998-2017 Zend Technologies
  with Zend OPcache v7.0.15, Copyright (c) 1999-2017, by Zend Technologies
Composer version 1.3.2 2017-01-27 18:23:41
Changed current directory to /composer
[repositories.packagist.org.type] composer
[repositories.packagist.org.url] https?://packagist.org
[repositories.packagist.org.allow_ssl_downgrade] true
[process-timeout] 300
[use-include-path] false
[preferred-install] auto
[notify-on-install] true
[github-protocols] [https, ssh]
[vendor-dir] vendor (/composer/vendor)
[bin-dir] {$vendor-dir}/bin (/composer/vendor/bin)
[cache-dir] /composer/cache
[data-dir] /composer
[cache-files-dir] {$cache-dir}/files (/composer/cache/files)
[cache-repo-dir] {$cache-dir}/repo (/composer/cache/repo)
[cache-vcs-dir] {$cache-dir}/vcs (/composer/cache/vcs)
[cache-ttl] 15552000
[cache-files-ttl] 15552000
[cache-files-maxsize] 300MiB (314572800)
[bin-compat] auto
[discard-changes] false
[autoloader-suffix]
[sort-packages] false
[optimize-autoloader] true
[classmap-authoritative] false
[apcu-autoloader] false
[prepend-autoloader] true
[github-domains] [github.com]
[bitbucket-expose-hostname] true
[disable-tls] false
[secure-http] true
[cafile]
[capath]
[github-expose-hostname] true
[gitlab-domains] [gitlab.com]
[store-auths] prompt
[archive-format] tar
[archive-dir] .
[home] /composer
Cache: /composer
Cwd: /srv
```

#### Map container's cache directory to your local cache directory

For instance, to map the composer cache directory in the container to your local composer cache directory.

```
docker run -it --rm -v "$(composer --global config data-dir)":/cache mickaelvieira/composer
```

#### Map container's working directory to your local working directory (.ie where is your `package.json`)

```
docker run -it --rm -v "$(pwd -P)":/srv mickaelvieira/composer
```
