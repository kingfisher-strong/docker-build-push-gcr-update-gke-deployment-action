FROM gcr.io/cloud-builders/gcloud

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

