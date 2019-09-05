# Github Action for Firestore Backups

## Usage

### Example workflow file

```
on:
  schedule:
    cron: "0 6 * * *"
name: Firestore backup
jobs:
  backup:
    runs-on: ubuntu-latest
    steps:
      - uses: lfdm/firestore-backup-gh-action
        with:
          - gcloudAuth: {{ secrets.FIREBASE_BACKUP_GCLOUD_AUTH }}
          - projectId: firestore-backup-test
          - storageBucket: gs://firestore-backup-test-backups
          - collectionIds: users,admins

```

This will create a firestore backup every day at 6am, using the service account stored as a base64 encoded string secret named `FIREBASE_BACKUP_GCLOUD_AUTH`.
The firestore is run in the project `firestore-backup-test`, the backup will be found in the Cloud Storage bucket `gs://firestore-backup-test-backups`.
Only the collections `users` and `admins` will be included in this backup.

### Inputs

- `gcloudAuth`: base64 encoded service account- ideally stored as a [secret](...) in your repository
- `projectId`: Your gcloud project id
- `storageBucket`: Gcloud Storage bucket to hold our backup
- `collectionIds`: Optional comma-separated list of collections to be included in the backup. If not specified, all collections will be backed up.
