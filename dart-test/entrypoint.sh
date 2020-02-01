#!/bin/bash
set -eu

echo "DTA_IS_FLUTTER=$DTA_IS_FLUTTER"
echo "DTA_DISABLE_LINTER=$DTA_DISABLE_LINTER"
echo "DTA_DISABLE_ANALYZER=$DTA_DISABLE_ANALYZER"
echo "DTA_DISABLE_TESTS=$DTA_DISABLE_TESTS"
echo "DTA_EXCLUDE_REGEX=$DTA_EXCLUDE_REGEX"

cd "$GITHUB_WORKSPACE"

for ppath in $(find . -name pubspec.yaml | grep -ve "$DTA_EXCLUDE_REGEX"); do
  echo "=== On $ppath ==="
  cd $(dirname "$ppath");

  echo "=== Downloading dependencies ==="
  if [ -z "$DTA_IS_FLUTTER" ]; then
    pub get
  else
    flutter pub get
  fi

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

  [ -d "test" ] && {
    if [ -z "$DTA_DISABLE_TESTS" ]; then
      echo "=== Running tests ==="
      if [ -z "$DTA_IS_FLUTTER" ]; then
        pub run test
      else
        flutter test
      fi
    fi
  }

  # Go back
  cd -
done
