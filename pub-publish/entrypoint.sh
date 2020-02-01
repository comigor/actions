#!/bin/sh
set -eu

echo "DTA_IS_FLUTTER=$DTA_IS_FLUTTER"

cd "$GITHUB_WORKSPACE"

echo "Downloading dependencies"
if [ -z "$DTA_IS_FLUTTER" ]; then
  pub get
else
  flutter pub get
fi

echo "$PUB_CREDENTIALS" > ~/.pub-cache/credentials.json

echo "Publish"
echo y | pub publish
