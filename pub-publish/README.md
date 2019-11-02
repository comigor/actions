# pub-publish action

Publishes a Dart package to pub.dartlang.org.

## Variables

I don't know if there's a better way of doing this.

| Required? | Variable              | Description                                                     |
|-----------|-----------------------|-----------------------------------------------------------------|
| Yes       | **PUB_CREDENTIALS**   | Your `~/.pub-cache/credentials.json` after logged in to pub.dev |

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
  secrets = ["PUB_CREDENTIALS"]
  needs = ["Test"]
}
```
