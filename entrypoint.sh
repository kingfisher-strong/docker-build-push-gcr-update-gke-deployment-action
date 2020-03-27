#!/bin/sh -l

set -e

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"


echo "${INPUT_SERVICE_ACCOUNT}" | base64 -d > "${HOME}/gcloud.json" 
echo "**********"
ls "${HOME}"
cat "${HOME}/gcloud.json"
echo "#############"
echo "${INPUT_SERVICE_ACCOUNT}"
gcloud auth activate-service-account --key-file="${HOME}/gcloud.json"

echo "%%%%%%%%%%%%%%%%%%%%%%%"
echo "${INPUT_REGISTRY}/${INPUT_NAME}"

docker build -t "${INPUT_REGISTRY}/${INPUT_NAME}" .

docker push "${INPUT_REGISTRY}/${INPUT_NAME}"