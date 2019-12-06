#!/bin/bash

echo "*** container run ***"
echo "CMOUNT: $CMOUNT (env)"
echo "ARGS:   $@"

echo ""
cd /app ; echo " -- do something here --"
echo ""

echo "*** container run complete ***"
