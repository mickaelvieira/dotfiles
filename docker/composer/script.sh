#!/bin/sh

php -v
composer --ansi --version
composer --ansi global config --list
echo -e "\x1b[32mCache: \x1b[33m${COMPOSER_HOME}\x1b[0m"
echo -e "\x1b[32mCwd: \x1b[33m$(pwd -P)\x1b[0m"

exit 0
