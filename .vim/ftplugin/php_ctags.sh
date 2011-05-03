#!/bin/bash
ctags -h ".php" -R --PHP-kinds=+cf --recurse --exclude=*/cache/* --exclude=*/logs/* --exclude=*/data/* --exclude="\.git" --exclude="\.svn" --totals=yes --languages=PHP --regex-PHP="/abstract class ([^ ]*)/\1/c/" --regex-PHP="/interface ([^ ]*)/\1/c/" --regex-PHP="/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/" &
