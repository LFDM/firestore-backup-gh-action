# Github Action for Firestore Backups

Creates backups of your Firestore using [data exports stored in Google Cloud Storage](https://firebase.google.com/docs/firestore/manage-data/export-import).

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
          gcloudAuth: ${{ secrets.FIREBASE_BACKUP_GCLOUD_AUTH }}
          projectId: firestore-backup-test
          storageBucket: gs://firestore-backup-test-backups
          collectionIds: users,admins

```

This will create a firestore backup every day at 6am, using the service account stored as a base64 encoded string secret named `FIREBASE_BACKUP_GCLOUD_AUTH`.
The firestore is run in the project `firestore-backup-test`, the backup will be found in the Cloud Storage bucket `gs://firestore-backup-test-backups`.
Only the collections `users` and `admins` will be included in this backup.

### Inputs

- `gcloudAuth`: Base64 encoded (gcloud service account)[https://cloud.google.com/iam/docs/creating-managing-service-accounts] - ideally stored as a [secret](https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables) in your repository. Store the results of `base64 service_account.json` there.
- `projectId`: Your gcloud project id
- `storageBucket`: Gcloud Storage bucket to hold our backup
- `collectionIds`: Optional comma-separated list of collections to be included in the backup. If not specified, all collections will be backed up.
