#!/bin/bash

if [ -z "$1" ]; then
  CNAME="dhelper:latest"
else
  CNAME="$1"
fi

# copy application files to a temp folder
./copy.sh tmp/
docker build -t $CNAME .
echo " -> created container image: $CNAME"

echo " -> cleaning up..."
rm -rf tmp/

echo "done!"