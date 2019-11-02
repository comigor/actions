FROM google/dart

ENV PUB_CREDENTIALS="{}"

LABEL "maintainer"="Igor Borges <igor@borges.dev>"
LABEL "repository"="https://github.com/comigor/actions"
LABEL "version"="2.0.0"

LABEL "com.github.actions.name"="Pub Publish"
LABEL "com.github.actions.description"="Publishes a Dart package to pub.dartlang.org"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
