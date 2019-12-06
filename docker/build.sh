#!/bin/bash

if [ -z "$1" ]; then
  CNAME="dhelper:latest"
else
  CNAME="$1"
fi

# copy application files to a temp folder
#
./copy.sh tmp/

# build the container and specify the container volume name
# and environment variable
#
docker build --build-arg CMOUNT=/mnt/outside -t $CNAME .
echo " -> created container image: $CNAME"

echo " -> cleaning up..."
rm -rf tmp/

echo "done!"