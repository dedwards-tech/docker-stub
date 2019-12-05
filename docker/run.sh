#!/bin/bash

# docker launch helper

if [ -z "$1" ]; then
  CNAME="dhelper:latest"
else
  CNAME="$1"
fi

docker run -it --rm -v $(PWD):/mnt/outside $CNAME $@
