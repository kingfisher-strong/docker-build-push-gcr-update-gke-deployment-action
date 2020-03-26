FROM gcr.io/cloud-builders/gcloud-slim

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

