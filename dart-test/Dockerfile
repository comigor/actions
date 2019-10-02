FROM google/dart

ENV DTA_DISABLE_LINTER=""
ENV DTA_DISABLE_ANALYZER=""
ENV DTA_DISABLE_TESTS=""
ENV DTA_EXCLUDE_REGEX="____________"

LABEL "maintainer"="Igor Borges <igor@borges.dev>"
LABEL "repository"="https://github.com/comigor/actions"
LABEL "version"="2.0.0"

LABEL "com.github.actions.name"="Dart Test"
LABEL "com.github.actions.description"="Test, analyze and lint a Dart package"
LABEL "com.github.actions.icon"="list"
LABEL "com.github.actions.color"="green"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
