#!/bin/sh -l

set -e


echo "${INPUT_SERVICE_ACCOUNT}" | base64 -d > "${HOME}/gcloud.json" 
gcloud auth activate-service-account --key-file="${HOME}/gcloud.json"

gcloud auth configure-docker
docker build -t "${INPUT_REGISTRY}/${INPUT_PROJECT_ID}/${INPUT_IMAGE_NAME}" .
docker push "${INPUT_REGISTRY}/${INPUT_PROJECT_ID}/${INPUT_IMAGE_NAME}"

gcloud container clusters get-credentials "${INPUT_CLUSTER}" --zone "${INPUT_ZONE}" --project "${INPUT_PROJECT_ID}" && gcloud components install kubectl && kubectl -n "${INPUT_NAMESPACE}" set image deployment/"${INPUT_DEPLOYMENT}" "${INPUT_CONTAINER}"="${INPUT_REGISTRY}/${INPUT_PROJECT_ID}/${INPUT_IMAGE_NAME}"
