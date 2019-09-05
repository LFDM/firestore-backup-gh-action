#!/bin/sh

set -e

SERVICE_ACCOUNT_FILE="$HOME/firebase_backup_gcloud_service_account.json"
echo "$INPUT_GCLOUDAUTH" | base64 --decode > "$SERVICE_ACCOUNT_FILE"
sh -c "gcloud auth activate-service-account --key-file=$SERVICE_ACCOUNT_FILE"
rm "$SERVICE_ACCOUNT_FILE"

if [[ -z $INPUT_COLLECTIONIDS]] then
  COLLECTION_IDS="--collection-ids $INPUT_COLLECTIONIDS"
fi

sh -c "gcloud beta firestore --project=$INPUT_PROJECTID" $INPUT_STORAGEBUCKET $COLLECTION_IDS"
