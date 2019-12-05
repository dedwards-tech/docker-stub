#!/bin/bash

# this script copies files "outside" of the docker build domain, to avoid
# the error of "Forbidden path outside the build context" problem.
#
# inputs:
#    $1  - temporary folder to place application files, must be all files
#          in the application.  please include the slash at the end of the
#          folder name; keeps scripts simple!
#

if [ -z "$1" ]; then
  TMP_DIR="tmp/"
else
  TMP_DIR="$1"
fi

mkdir -p $TMP_DIR

echo "copying application files to $TMP_DIR"

touch "$TMP_DIR""delete_me.txt"
