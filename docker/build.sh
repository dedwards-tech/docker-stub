#!/bin/bash

if [ -z "$1" ]; then
  CNAME="dhelper:latest"
else
  CNAME="$1"
fi

docker build -t $CNAME .

echo "Docker image $CNAME created successfully!"
