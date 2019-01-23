#!/bin/sh
set -eu

cd "$GITHUB_WORKSPACE"

echo "Downloading dependencies"
pub get

echo "Update Pub token from secret"
echo "{\"accessToken\":\"$PUB_ACCESS_TOKEN\",\"refreshToken\":\"$PUB_REFRESH_TOKEN\",\"tokenEndpoint\":\"https://accounts.google.com/o/oauth2/token\",\"scopes\":[\"https://www.googleapis.com/auth/plus.me\",\"https://www.googleapis.com/auth/userinfo.email\"],\"expiration\":$PUB_EXPIRATION}" > ~/.pub-cache/credentials.json

echo "Publish"
echo y | pub publish
