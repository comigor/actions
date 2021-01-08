# check-version-and-changelog action

Check for package version and update in CHANGELOG.

## Variables

| Required? | Variable       | Description                                                               |
|-----------|----------------|---------------------------------------------------------------------------|
| Yes       | **base_ref**   | GitHub base_ref                                                           |
| No        | **repo_token** | Access token for sending errors as a PR message                           |

## Outputs

| Output              | Description                                             |
|---------------------|---------------------------------------------------------|
| **package_version** | The retrieved package version                           |
