
FROM gcr.io/cloud-builders/gcloud-slim@sha256:122deb6687f687b6f9293e0ab7d1919355bc3dd19cb9be68524d71a69b8bc436

LABEL name="firestore-backup-gh-action"
LABEL version="0.0.1"
LABEL maintainer="LFDM <1986@gmail.com>"

LABEL "com.github.actions.name"="Firestore Backups"
LABEL "com.github.actions.description"="Google Action for Firestore backups"
LABEL "com.github.actions.icon"="log-in"
LABEL "com.github.actions.color"="orange"

RUN gcloud components install beta

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]