FROM google/dart

ENV PUB_ACCESS_TOKEN="ya29.GlsYBk9..."
ENV PUB_REFRESH_TOKEN="1/tH8PN_OA920..."
ENV PUB_EXPIRATION="15369430..."

LABEL "maintainer"="Igor Borges <igor@borges.me>"
LABEL "repository"="https://github.com/Igor1201/actions"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Pub Publish"
LABEL "com.github.actions.description"="Publishes a Dart package to pub.dartlang.org"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
