# pub-publish action

Publishes a Dart package to pub.dartlang.org.

## Variables

I don't know if there's a better way of doing this.

| Required? | Variable                 | Description                                         |
|-----------|--------------------------|-----------------------------------------------------|
| Yes       | **PUB_ACCESS_TOKEN**     | `accessToken` from `~/.pub-cache/credentials.json`  |
| Yes       | **PUB_REFRESH_TOKEN**    | `refreshToken` from `~/.pub-cache/credentials.json` |
| Yes       | **PUB_EXPIRATION**       | `expiration` from `~/.pub-cache/credentials.json`   |
| No        | **PUB_SCOPES**           | `scopes` from `~/.pub-cache/credentials.json`. Defaults to `["https://www.googleapis.com/auth/plus.me","https://www.googleapis.com/auth/userinfo.email"]` |

## Example workflow

```hcl
workflow "Test and deploy" {
  on = "push"
  resolves = ["Deploy"]
}

action "Test" {
  uses = "comigor/actions/dart-test@master"
}

action "Deploy" {
  uses = "comigor/actions/pub-publish@master"
  secrets = ["PUB_ACCESS_TOKEN", "PUB_REFRESH_TOKEN", "PUB_EXPIRATION", "PUB_SCOPES"]
  needs = ["Test"]
}
```
