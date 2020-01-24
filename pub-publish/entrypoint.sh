#!/bin/sh
set -eu

cd "$GITHUB_WORKSPACE"

echo "Downloading dependencies"
flutter pub get

echo "$PUB_CREDENTIALS" > ~/.pub-cache/credentials.json

echo "Publish"
echo y | pub publish
