#!/bin/bash

# docker launch helper

if [ -z "$1" ]; then
  echo "usage:"
  echo "   ./run.sh <container_name>:<version> [<other_args>]"
  echo "ERR: container name:version must be the first input parameter"
  exit 1
else
  CNAME="$1"
fi

docker run -it --rm -v $(PWD):/mnt/outside $@
