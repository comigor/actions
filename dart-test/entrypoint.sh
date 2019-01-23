#!/bin/bash
set -eu

cd "$GITHUB_WORKSPACE"

echo "Downloading dependencies"
pub get

if [ -z "$DTA_DISABLE_LINTER" ]; then
  echo "Running linter"
  [[ "$(dartfmt -n . | wc -l)" -eq "0" ]]
fi

if [ -z "$DTA_DISABLE_ANALYZER" ]; then
  echo "Running Dartanalyzer"
  dartanalyzer --fatal-infos --fatal-warnings .
fi

if [ -z "$DTA_DISABLE_TESTS" ]; then
  echo "Running tests"
  pub run test
fi
