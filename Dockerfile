
FROM gcr.io/cloud-builders/gcloud-slim:234.0.0

LABEL name="gcloud-auth"
LABEL version="0.0.1"
LABEL maintainer="LFDM <1986@gmail.com>"

LABEL "com.github.actions.name"="Firestore Backups"
LABEL "com.github.actions.description"="Google Action for Firestore backups"
LABEL "com.github.actions.icon"="log-in"
LABEL "com.github.actions.color"="orange"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]