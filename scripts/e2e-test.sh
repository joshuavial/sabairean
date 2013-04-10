#!/bin/bash

BASE_DIR=`dirname $0`

echo ""
echo "Starting Karma Test Server (https://github.com/karma-runner/karma)"
echo "-------------------------------------------------------------------"

$(npm bin)/karma start $BASE_DIR/../config/testacular-e2e.conf.js $*
