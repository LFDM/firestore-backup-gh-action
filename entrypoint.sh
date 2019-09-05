#!/bin/sh

set -e

SERVICE_ACCOUNT_FILE="$HOME/firebase_backup_gcloud_service_account.json"
echo "$INPUT_GCLOUDAUTH" | base64 --decode > "$SERVICE_ACCOUNT_FILE"
sh -c "gcloud auth activate-service-account --key-file=$SERVICE_ACCOUNT_FILE"
rm "$SERVICE_ACCOUNT_FILE"

[ -z "$INPUT_COLLECTIONIDS" ] || COLLECTION_IDS="--collection-ids $INPUT_COLLECTIONIDS"

sh -c "gcloud beta firestore --project=$INPUT_PROJECTID export $INPUT_STORAGEBUCKET $COLLECTION_IDS"