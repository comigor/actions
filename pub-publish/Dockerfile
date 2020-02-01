FROM cirrusci/flutter:stable

ENV PUB_CREDENTIALS="{}"
ENV PUB_IS_FLUTTER=""

LABEL "maintainer"="Igor Borges <igor@borges.dev>"
LABEL "repository"="https://github.com/comigor/actions"
LABEL "version"="3.1.0"

LABEL "com.github.actions.name"="Pub Publish"
LABEL "com.github.actions.description"="Publishes a Dart package to pub.dartlang.org"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

USER root

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "timeout 60 /entrypoint.sh"]
