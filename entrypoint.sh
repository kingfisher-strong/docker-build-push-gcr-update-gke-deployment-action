#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

set -e
echo "${INPUT_SERVICE_ACCOUNT}" | base64 --decode > "${HOME}/gcloud.json" 
gcloud auth activate-service-account --key-file="${HOME}/gcloud.json"