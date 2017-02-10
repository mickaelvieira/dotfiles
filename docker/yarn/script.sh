#!/bin/sh

echo -e "\x1b[32mYarn \x1b[33m$(yarn version)\x1b[0m"
echo -e "\x1b[32mNode \x1b[33m$(node -v)\x1b[0m"
echo -e "\x1b[32m$(sass -v)\x1b[0m"
echo -e "\x1b[32mCache: \x1b[33m$(yarn cache dir)\x1b[0m"

exit 0
