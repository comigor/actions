# pub-publish action

Publishes a Dart package to pub.dartlang.org.

## Variables

I don't know if there's a better way of doing this.

| Required? | Variable              | Description                                                     |
|-----------|-----------------------|-----------------------------------------------------------------|
| Yes       | **PUB_CREDENTIALS**   | Your `~/.pub-cache/credentials.json` after logged in to pub.dev |
| No        | **PUB_IS_FLUTTER**    | Run everything on Flutter context instead of Dart's        |
