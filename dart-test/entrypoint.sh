#!/bin/bash
set -eu

cd "$GITHUB_WORKSPACE"

for ppath in $(find . -name pubspec.yaml | grep -ve "$DTA_EXCLUDE_REGEX"); do
  echo "=== On $ppath ==="
  cd $(dirname "$ppath");

  [ -d "test" ] && {
    echo "=== Downloading dependencies ==="
    flutter pub get

    if [ -z "$DTA_DISABLE_LINTER" ]; then
      echo "=== Running linter ==="
      dartfmt -n . --set-exit-if-changed

      if [ $? -ne 0 ]; then
        echo "Linter failed. Check the files above."
      fi
    fi

    if [ -z "$DTA_DISABLE_ANALYZER" ]; then
      echo "=== Running analyzer ==="
      dartanalyzer --fatal-infos --fatal-warnings .
    fi

    if [ -z "$DTA_DISABLE_TESTS" ]; then
      echo "=== Running tests ==="
      flutter test
    fi
  }

  # Go back
  cd -
done
